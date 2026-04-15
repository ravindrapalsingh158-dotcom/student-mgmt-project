class ApplicationController < ActionController::Base

  layout "application"
  
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end


def after_sign_in_path_for(resource)
  if resource.is_a?(AdminUser)
    admin_dashboard_path
  elsif resource.is_a?(Student)
    student_dashboard_path
  else
    root_path
  end
end