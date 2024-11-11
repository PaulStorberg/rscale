# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :html, :json

  def new
    respond_to do |format|
      format.html { super }
      format.js { render "sign_in_form.js" }
    end
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    
    respond_to do |format|
      if self.resource
        sign_in(resource_name, resource)
        format.html { redirect_to after_sign_in_path_for(resource) }
        format.json { render json: { success: true, redirect: after_sign_in_path_for(resource) } }
      else
        format.html { 
          flash[:alert] = "Incorrect email or password."
          redirect_to root_path 
        }
        format.json { render json: { success: false, errors: ["Invalid credentials"] }, status: :unauthorized }
      end
    end
  end

  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
