class UsersController < ApplicationController
  # before_action :require_login, except: [:new, :create]
  # before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
    @states = state_index
  end
  def new
  end

  def create
    if params[:user][:first_name].to_s == '' || params[:user][:last_name].to_s == '' || params[:user][:email].to_s == '' || params[:user][:password].to_s == '' || params[:user][:location].to_s == ''
      flash[:create_error] = "can't be blank"
      if params[:user][:password].to_s != params[:user][:password_confirmation].to_s
        flash[:error] = "Passwords do not match"
        redirect_to "/"
      end
    else
      if params[:user][:password] == params[:user][:password_confirmation]
          @user = User.create(user_params)
          session[:user_id] = @user.id
          redirect_to "/events"
        end
    end
  end

  def login
    if User.find_by_email(params[:user][:email]).nil?
      flash[:noemail] = "Email does not exist"
      redirect_to "/"
    end
    @user = User.find_by_email(params[:user][:email])
    if @user.authenticate(params[:user][:password]) == false
      flash[:error] = "Invalid"
      redirect_to "/"
    else
      session[:user_id] = @user.id
      redirect_to "/events"
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @states = state_index
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(first_name:params[:user][:first_name],last_name:params[:user][:last_name], email:params[:user][:email],location:params[:user][:location],state:params[:user][:state])
      redirect_to "/events"
    else
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password)
  end
end
