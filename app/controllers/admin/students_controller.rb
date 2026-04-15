class Admin::StudentsController < ApplicationController
  layout "admin"

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_students_path, notice: "Student updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_students_path, notice: "Student deleted successfully"
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :address, :contact)
  end
end