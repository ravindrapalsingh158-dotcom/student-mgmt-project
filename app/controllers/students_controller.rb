class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_student!


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
      redirect_to students_path  , notice: "Student was successfully created." 
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
      redirect_to students_path  , notice: "Student was successfully updated."
    else
      render :edit                
    end
  end 

  def destroy
  
    @student.destroy
    redirect_to students_path, notice: "Student was successfully deleted."
  end

  def set_student  
    @student = Student.find(params[:id])
  end
    
  private
    def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :email,
      :contact,
      :address,
      :date_of_birth,
      :marks
    )
  end

def dashboard
  @student = current_student
end
end