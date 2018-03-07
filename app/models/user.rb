class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_technologies
  has_many :technologies, through: :user_technologies
  has_many :comments
  # has_many :tickets
  has_many :tickets_as_student, :class_name => "Ticket", :foreign_key => :student_id
  has_many :tickets_as_teacher, :class_name => "Ticket", :foreign_key => :teacher_id


  def teacher?
    self.technologies.any?
  end
end
