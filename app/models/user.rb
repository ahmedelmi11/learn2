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
  # after_create :get_user_avatar
  validates :first_name, presence: true
  validates :last_name, presence: true


  def teacher?
    self.technologies.any?
  end

  # def get_user_avatar
  #   url = "https://api.github.com/users/#{self.github_username}"
  #   user_serialised = open(url).read
  #   user = JSON.parse(user_serialised)
  #   self.github_avatar_url = user['avatar_url']
  #   raise
  #   self.save
  #   rescue
  #     self.github_avatar_url = "http://topmops.net/wp-content/uploads/2017/01/avatar-placeholder-generic.jpg"
  # end
end
