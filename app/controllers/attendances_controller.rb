class AttendancesController < ApplicationController
  def create
    @joining = Attendance.create(user_id:session[:user_id], event_id:params[:event_id])
    redirect_to request.referer
  end

  def destroy
    unjoin = Attendance.find_by_user_id_and_event_id(session[:user_id], params[:event_id])
    unjoin.destroy
    redirect_to request.referer
  end
end
