class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_items_path
    when EndUser
      end_user_path(current_end_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    new_end_user_session_path
  end
end
