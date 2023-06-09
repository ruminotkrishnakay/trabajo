class Authentication::SessionsController < ApplicationController
    def new
    end
  
    def create
      @user = User.find_by("email = :login", { login: params[:login] })
  
      if @user&.authenticate(params[:password])
        redirect_to users_path, notice: t('.created')
      else
        redirect_to new_session_path, alert: t('.failed')
      end
    end
  end