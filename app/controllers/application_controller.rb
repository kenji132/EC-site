class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:phone_number,:street_address])
  end

  def after_sign_in_path_for(resource) 
    case resource
    when EndUser
      end_users_my_page_path
    when Admin
      admin_root_path
    end
  end
  def after_sign_out_path_for(resource) 
    if resource == :end_user
      root_path
    else
      new_admin_session_path
    end
    
  end
end
