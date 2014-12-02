class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource) 
  	if current_user.user_type == "system_administrator"
  		system_administrators_path
  	elsif current_user.user_type == "office_worker"
  		office_workers_path
  	elsif current_user.user_type == "physician"
  		physician_appointments_path
  	else
			stored_location_for(resource) || request.referer || root_path
  	end
  end
end