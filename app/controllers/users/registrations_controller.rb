# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  # GET /resource/sign_up
  def new
    respond_to do |format|
      format.html { super }
      format.js { render "new.js" }
    end
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    
    respond_to do |format|
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          format.html { respond_with resource, location: after_sign_up_path_for(resource) }
          format.json { render json: { success: true, redirect: after_sign_up_path_for(resource) } }
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          format.html { respond_with resource, location: after_inactive_sign_up_path_for(resource) }
          format.json { render json: { success: true, redirect: after_inactive_sign_up_path_for(resource) } }
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        format.html { respond_with resource }
        format.json { render json: { success: false, errors: resource.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # GET /resource/edit
  def edit
    render "edit_user_form.js"
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
