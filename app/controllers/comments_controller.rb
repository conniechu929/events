class CommentsController < ApplicationController
  def create
    # @event_id = Event.find(params[:event_id])
    @comment = Comment.create(content:params[:content], user_id:params[:user_id], event_id:params[:event_id])
    redirect_to "/events/#{params[:event_id]}"
  end

end
