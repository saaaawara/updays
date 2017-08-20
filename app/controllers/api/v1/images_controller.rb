module Api
    module V1
        class ImagesController < ApplicationController

            # index image
            def index
                @images = Image.all
                render 'api/v1/images/index', formats: 'json', handlers: 'jbuilder'
            end

            # show image
            def show
            end

            # create image
            def create
                @image = Image.new(image_params)
                if @image.save
                else
                end
            end

            # destroy image
            def destroy
                @image = Image.find_by(id: params[:id])
                @image.destroy
            end

            # hash tag
            def hash_tag
                @images = Image.where(jenre: params[:jenre])
                render 'api/v1/images/hashtag', formats: 'json', handlers: 'jbuilder'
            end

            private
              def image_params
                params.permit(:image, :jenre)
              end
        end
    end
end
