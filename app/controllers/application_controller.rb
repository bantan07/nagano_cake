class ApplicationController < ActionController::Base
   add_flash_types :success, :info, :warning, :danger
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    items_path(resource)
  end
  
  def after_sign_up_path_for(resource)
    items_path(resource)
  end
  
  
  def after_sign_out_path_for(resource)
    root_path(resource)
  end

  protected
  
  def after_sign_in_path_for(resource)
    admin_items_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kama])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kama])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
  end
  
end
