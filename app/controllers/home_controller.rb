class HomeController < ApplicationController
    layout "home" 
  def index
  end

  def student
  end
def admin
  redirect_to new_admin_user_session_path
end
end