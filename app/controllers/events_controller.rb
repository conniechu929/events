class EventsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @states = state_index
    @events = Event.all
    @attendances = Attendance.all
  end

  def create
    if params[:name].to_s == '' || params[:location].to_s == '' || params[:date] == ''
      flash[:create_error] = "Can't be blank"
      if Date.parse(params[:date]) <= Date.today
        flash[:error] = "Date needs to be in the future"
        redirect_to "/events"
      end
    elsif Date.parse(params[:date]) <= Date.today
      flash[:error] = "Date needs to be in the future"
      redirect_to '/events'
    else
      # @user = User.find(params[:user_id])
      @event = Event.create(user_id:params[:user_id], name:params[:name], date:params[:date], location:params[:location], state:params[:state])
      redirect_to "/events"
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @comments = Comment.where(:event_id => params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    @states = state_index
  end

  def update
    @event = Event.find(params[:id])
    if @event.user_id == session[:user_id]
      @event.update(name:params[:name],date:params[:date],location:params[:location],state:params[:state])
      redirect_to "/events"
    else
      redirect_to "/events/#{params[:id]}/edit"
    end
  end

  def destroy
    event = Event.find_by_id(params[:event_id])
    puts event.name
    puts "*******"
    event.destroy if event.user_id == session[:user_id]
    redirect_to "/events"
  end

end
