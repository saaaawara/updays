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

            # create daily
            def create
                p "start daily create"
                p "AAAAAAA"
                p params[:image]
                # file = params[:test]
                p "BBBBBBBB"
                # p daily_params[:image]
                # p params[:test]
                @daily = Daily.new(daily_params)
                # @dialy = Daily.new(image: params[:image])

                # @daily_image = Daily.new(user_id: params[:user_id], title: params[:title], 
                #     comment: params[:comment], date: params[:date], 
                #     jenre: params[:jenre], image: params[:image])

                # @daily_image.save
                @daily.save
                # @daily.title = params[:title]
                # @daily[:image] = params[:image]
                # p params[:@tempfile]
                p "CCCCCC"
                # p @daily_image.save
                # @daily.user_id = 1
                # @daily.comment = "testtest"
                
                # @daily = Daily.new(image: params[:image])
                # @daily = Daily.new(daily_params)
                # if @daily.save
                # upload_file = ActionDispatch::Http::UploadedFIle.new
                # else
                # end
            end

            def upload
                # p "start image upload"
                # imageFile =
            end

            # destroy daily
            def destroy
            end

            private
              def daily_params
                # params.require(:daily).permit(:user_id, :title, :comment, :date, :jenre, :image)
                params.permit(:user_id, :title, :comment, :date, :jenre, :image)
                # params.require(:daily).permit(:image)
              end
        end
    end
end
