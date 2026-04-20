class CrudNotificationMailer < ApplicationMailer
  default from: "yourgmail@gmail.com"

  def create_notification(student)
    @student = student
    mail(to: @student.email, subject: "Student Created Successfully")
  end

  def update_notification(student)
    @student = student
    mail(to: @student.email, subject: "Student Updated Successfully")
  end

  def delete_notification(student)
    @student = student
    mail(to: @student.email, subject: "Student Deleted")
  end
end