class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to unauthorized_path, :alert => exception.message
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :middle_name, :last_name, :phone1, :phone2, :role_id])
    
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:first_name, :middle_name, :last_name, :phone1, :phone2, :email, :password, :password_confirmation, :current_password, :customer_id, roles_attributes: [:role_id]) 
    }
  end
  
  def after_sign_in_path_for(resource)
    logger.debug "registration controller : resources is : "
    logger.debug "current_user.id is #{current_user.id}"
    _user = User.new
      if _user.campaign_manager(current_user.id)
        logger.debug "Application Controoler : def after_sign_in_path_for(resource) : CAMPAIGN MANAGER"
        '/campaign_manager_landing' 
      elsif _user.specialist(current_user.id)
        logger.debug "Application Controoler : def after_sign_in_path_for(resource) : SPECIALIST"
        '/specialist_landing'
      elsif _user.admin(current_user.id)
        logger.debug "Application Controoler : def after_sign_in_path_for(resource) : ADMIN"
        '/admin_landing'
      else
      end
  end
  
end
