class ApplicationController < ActionController::Base

  add_flash_types :success, :info, :warning, :danger
  
  
  
  def after_sign_out_path_for(resource)
    root_path(resource)
  end
  
  

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
  end
  
  
end
