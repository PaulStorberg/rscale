class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit::Authorization

  before_action :set_csrf_cookie

  private

  def set_csrf_cookie
    cookies['CSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-CSRF-TOKEN'])
  end
end
