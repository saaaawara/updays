module Api
    module V1
        class SchedulesController < ApplicationController
            # index shedule
            def index
                @schedules = Schedule.all
                render 'api/v1/schedules/index', formats: 'json', handlers: 'jbuilder'
            end
        
            # show schedule
            def show
                # p "oooooo"
                p params[:id]
                # p "pppppppppppppp"
                @schedule_count = Schedule.where(user_id: params[:id]).count
                @schedules = Schedule.where(user_id: params[:id])
                p @schedules
                @has_event = Event.where(user_id: params[:id])
                @has_event_count = @has_event.count
                @achieve_count = 0
                @has_event.each { |e|
                    if Daily.find_by(user_id: params[:id], jenre: e.jenre)
                        p e
                        @achieve_count = @achieve_count + 1
                    else
                    end
                }
                p @has_event_count
                p @achieve_count
                render 'api/v1/schedules/show', formats: 'json', handlers: 'jbuilder'
            end

            # create schedule
            def create
                p "start schedule create"
                schedule_params[:user_id] = schedule_params[:user_id].to_s
                @schedule = Schedule.new(schedule_params)
                p @schedule[:user_id]
                # logined?がいる
                if @schedule.save
                    # p "schedule ok"
                    # render 'api/v1/schedules/show', formats: 'json', handlers: 'jbuilder'
                end
            end

            def destroy
                # p schedule_params[:contents]
                @schedule = Schedule.find_by(user_id: schedule_params[:user_id].to_s,
                    contents: schedule_params[:contents], date: schedule_params[:date])
                # p schedule_params.user_id
                p @shecule
                @schedule.destroy
            end

            private
              def schedule_params
                params.require(:schedule).permit(:user_id, :contents, :date, :jenre)
              end
        end
    end
end
