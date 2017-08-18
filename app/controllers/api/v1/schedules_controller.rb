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
                @schedules = Schedule.where(user_id: params[:id])
                p @schedules
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
                @schedule = Schedule.find_by(user_id: schedule_params[:user_id],
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
