class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(email: params[:email])

    if student && student.role == params[:role]
      session[:student_id] = student.id

      if student.role == "admin"
        redirect_to admin_students_path, notice: "Admin logged in"
      else
        redirect_to students_path, notice: "User logged in"
      end
    else
      redirect_to login_path, alert: "Invalid login"
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to login_path, notice: "Logged out"
  end
end