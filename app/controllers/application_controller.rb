class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  def state_index
    @@states = ['AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN',
      'MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV',
      'WI','WY']
  end
  helper_method :state_index
  # def current_user
  # User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user
  #
  # def require_login
  #   redirect_to '/' if session[:user_id] == nil
  # end
  #
  # def require_correct_user
  #   user = User.find(params[:id])
  #   redirect_to "/users/#{current_user.id}" if current_user != user
  # end
end
