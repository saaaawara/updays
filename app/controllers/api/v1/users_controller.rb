module Api
  module V1
    class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    #
    # skip_before_filter :verify_authenticity_token

      # GET /users
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1
      def show
        # p User.find_by(id: params[:id])[:remember]
        p "start users show"
        if(logged_in?(params[:id]))
          p "login"
          render 'api/v1/show', formats: 'json', handlers: 'jbuilder'
        else
          p "not login"
        end
      end

      # POST /users
      def create
        p "start users create"
        @user = User.new(user_params)
        # @user[:remember] = @user[:id]
        # p @user[:id]
        # p @user[:name]
        # p @user[:password]
        # p session[:user_id]
        # @user[:remember] = @user[:id]
        if @user.save
          log_in @user
          remember @user
          render 'api/v1/create', formats: 'json', handlers: 'jbuilder'
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
        
        def user_params
          params.require(:user).permit(:name, :password, :email, :prefecture, :city)
        end
    end
  end
end
