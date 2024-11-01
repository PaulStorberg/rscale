class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  protect_from_forgery prepend: true

  rescue_from Pundit::NotAuthorizedError,  with: :user_not_authorized
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_email

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def invalid_email
    flash[:alert] = "Somethings up with that email..."
    redirect_to root_path
  end
end
