class Ticket < ApplicationRecord
  # has_one :teacher, :class_name => 'User', :foreign_key => 'teacher_id'
  # has_one :teacher, foreign_key => "teacher_id", class_name => "User"
  belongs_to :student, :class_name => "User", :foreign_key => :student_id
  belongs_to :teacher, :class_name => "User", :foreign_key => :teacher_id, optional: true
  has_many :ticket_technologies
  has_many :technologies, through: :ticket_technologies

  enum status: { pending: 0, active: 1, finished: 2 }

  def available?
    self.teacher_id.nil?
  end

  def taken?
    !available?
  end
end
