class Student < ApplicationRecord
    validates :first_name, presence:true
    validates :last_name, presence:true
  validates :email, uniqueness: { case_sensitive: false, scope: :id }

  has_many :blogs

  has_and_belongs_to_many :courses

  has_many :student_projects
    has_many :projects, through: :student_projects

  before_create :display_message

  def display_message
     puts "Creating student:before action u execute"
   end
end
