class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_technologies
  has_many :technologies, through: :user_technologies
  has_many :comments

  has_many :answered_tickets, :class_name => 'Ticket', :foreign_key => 'teacher_id'
  has_many :posted_tickets, :class_name => 'Ticket', :foreign_key => 'student_id'
end
