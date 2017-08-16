module Api
  module V1
    class SessionsController < ApplicationController

      def new
      end

      # /login
      def create
        p "start sessions create"
        @user = sessions_params
        p @user[:name]
        user_id = User.find_by(name: @user[:name]).id
        p user_id
        if
          # p "BBBBBBBBBBBBBBBBBBBBB"
          p user_id
          user = User.find_by(id: user_id)
          # p user[:id]
          # p user[:password]
          # user[:password] = params[:password]
          # if user[:password]
          if user[:password] == @user[:password]
            # p "CCCCCCCCCCCCCCCCCCCCCCCCC"
            log_in user
            remember user
            p "success login"
            @user[:id] = user_id
            render 'api/v1/sessions/create', formats: 'json', handler: 'jbuilder'
          end
        end
      end

      # /logout
      def destroy
        p "start logout"
        user = User.find_by(id: params[:id])
        if user.nil?
          p "cannot logout"
        else
          p "success search"
          log_out(user)
          p "success logout"
        end
      end

      private
        # session parameter
        def sessions_params
          params.require(:user).permit(:name, :password)
        end

    end
  end
end