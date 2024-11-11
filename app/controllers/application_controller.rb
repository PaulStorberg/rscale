class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  protect_from_forgery prepend: true

  rescue_from Pundit::NotAuthorizedError,  with: :user_not_authorized
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_email

  before_action :set_csrf_cookie

  private

  def set_csrf_cookie
    cookies['CSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def invalid_email
    flash[:alert] = "Somethings up with that email..."
    redirect_to root_path
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-CSRF-TOKEN'])
  end
end
