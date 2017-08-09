module Api
  module V1
    class SessionsController < ApplicationController

      def new
      end

      # /login
      def create
        p "start sessions create"
        user = User.find_by(id: params[:id])
        if user
          log_in user
          remember user
          render 'api/v1/show', formats: 'json', handler: 'jbuilder'
        else
        end
      end

      # /logout
      def destroy
        p "start logout"
        user = User.find_by(remember: params[:id])
        p "success search"
        log_out(user)
        p "success logout"
      end


    end
  end
end