class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  def index
    @students = Student.all
  end 

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
      puts params.inspect 
    if @student.save
      redirect_to students_path   
    else
      render :new                 
    end
  end

  def show
  end

  def edit 
  end

  def update
   
    if @student.update(student_params)
      redirect_to students_path  
    else
      render :edit                
    end
  end 

  def destroy
  
    @student.destroy
    redirect_to students_path
  end

  def set_student  private
    @student = Student.find(params[:id])
  end
    
    def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :address,
      :adhar
    )
  end

end