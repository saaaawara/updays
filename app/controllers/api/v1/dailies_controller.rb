module Api
    module V1
        class DailiesController < ApplicationController

            # index daily
            def index
                @dailies = Daily.all
                render 'api/v1/dailies/index', formats: 'json', handlers: 'jbuilder'
            end

            # show daily
            def show
                @daily = Daily.where(user_id: params[:id])
                render 'api/v1/dailies/show', formats: 'json', handlers: 'jbuilder'
            end

            # test create
            def test_create
                p "start test_create"
                @daily = Daily.new(user_id: params[:user_id], title: params[:title], 
                    comment: params[:comment], date: params[:date], 
                    jenre: params[:jenre])
                @daily.save
            end

            # create daily
            def create
                p "start daily create"
                # p "AAAAAAA"

                @daily = Daily.where(user_id: daily_params[:user_id].to_s).order("updated_at DESC").first
                p @daily
                @daily.update_attributes(title: daily_params[:title],
                    comment: daily_params[:comment],
                    date: daily_params[:date],
                    jenre: daily_params[:jenre])
                
                # @daily = Daily.new(daily_params)

                # @dialy = Daily.new(image: params[:image])

                # @daily_image = Daily.new(user_id: params[:user_id], title: params[:title], 
                #     comment: params[:comment], date: params[:date], 
                #     jenre: params[:jenre], image: params[:image])
            end

            def upload
                p "start image upload"
                user_id = params[:user_id].to_s
                @daily_image = Daily.new(user_id: user_id,
                        image: params[:image])
                @daily_image.save
            end

            # destroy daily
            def destroy
            end

            private
              def daily_params
                # params.require(:daily).permit(:user_id, :title, :comment, :date, :jenre, :image)
                params.permit(:user_id, :title, :comment, :date, :jenre)
                # params.require(:daily).permit(:image)
              end
        end
    end
end
