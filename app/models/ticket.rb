class Ticket < ApplicationRecord
  # has_one :teacher, :class_name => 'User', :foreign_key => 'teacher_id'
  # has_one :teacher, foreign_key => "teacher_id", class_name => "User"
  belongs_to :student, :class_name => "User", :foreign_key => :student_id
  belongs_to :teacher, :class_name => "User", :foreign_key => :teacher_id
  has_many :ticket_technologies
  has_many :technologies, through: :ticket_technologies

end
