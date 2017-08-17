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
                @event = Event.new(event_params)
                if @event.save

                end
            end

            # destroy events
            def destroy
            end

            private
              def event_params
                params.require(:event).permit(:user_id, :jenre)
              end
        end
    end
end
