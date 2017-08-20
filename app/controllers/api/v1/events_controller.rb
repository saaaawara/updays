module Api
    module V1
        class EventsController < ApplicationController

            # index events
            def index
                @events = Event.all
                render 'api/v1/events/index', formats: 'json', handlers: 'jbuilder'
            end

            # show events
            def show
                @events = Event.where(user_id: params[:id])
                render 'api/v1/events/show', formats: 'json', handlers: 'jbuilder'
            end

            # create events
            def create
                p "start event"
                user_id = event_params[:user_id].to_s
                tmp_array = event_params[:jenre].split
                p tmp_array
                tmp_array.each { |jenre|
                    p jenre
                    @event = Event.new(user_id: user_id,
                        jenre: jenre)
                    if @event.save
                    end
                }
            end

            # destroy events
            def destroy
                @event = Event.find_by(user_id: event_params[:user_id].to_s,
                    jenre: event_params[:jenre])
                p @event
                @event.destroy
            end

            private
              def event_params
                params.require(:event).permit(:user_id, :jenre)
              end
        end
    end
end
