class Student < ApplicationRecord
  # Basic validations
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true

  validates :first_name, :last_name,
            format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  validates :contact, presence: true,
            format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP }

  # Associations
  has_many :blogs, dependent: :destroy
  has_and_belongs_to_many :courses

  has_one_attached :profile_picture

  has_many :student_projects
  has_many :projects, through: :student_projects

  # Callbacks
  before_create :display_message
  after_create :display_student_age

  # Custom validation
  validate :validate_student_age

  # Methods
  def display_message
    Rails.logger.info "Creating student"
  end

  def display_student_age
    if date_of_birth.present?
      age = ((Date.today - date_of_birth).to_i / 365.25)
      Rails.logger.info "Student Age: #{age.to_i}"
    else
      Rails.logger.info "DOB not provided"
    end
  end

  def validate_student_age
    return unless date_of_birth.present?

    age = ((Date.today - date_of_birth).to_i / 365.25)

    if age < 18
      errors.add(:date_of_birth, "Student must be at least 18 years old")
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end 


  def self.ransackable_attributes(auth_object = nil)
  ["first_name", "last_name", "email", "address", "contact", "date_of_birth"]
end

  def age
    if date_of_birth.present?
      ((Date.today - date_of_birth).to_i / 365.25).to_i
    else
      "N/A"
    end
  end 
end