class Admin::StudentsController < AdminControllers
  before_action :set_student, only: [:show, :edit, :update, :destroy]


require 'kaminari'
  
  def index
  
  @q = Student.ransack(params[:q])
  @students = @q.result.page(params[:page]).per(5)

  end 

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
      puts params.inspect 
    if @student.save
      CrudNotificationMailer.create_notification(@student).deliver_now
      redirect_to admin_students_path  , notice: "Student was successfully created." 
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
             CrudNotificationMailer.update_notification(@student).deliver_now
      redirect_to admin_students_path  , notice: "Student was successfully updated."
    else
      render :edit                
    end
  end 

  def destroy

      Rails.logger.info "MAILER STARTED"
  
    @student.destroy
    redirect_to admin_students_path, notice: "Student was successfully deleted."
Rails.logger.info "MAIL SENT"
  rescue => e
    Rails.logger.info "MAIL ERROR: #{e.message}"

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
      :profile_picture,
    )
  end


    
end