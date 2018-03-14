class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :user_technologies
  has_many :technologies, through: :user_technologies
  has_many :comments
  # has_many :tickets
  has_many :tickets_as_student, :class_name => "Ticket", :foreign_key => :student_id
  has_many :tickets_as_teacher, :class_name => "Ticket", :foreign_key => :teacher_id
  # after_create :get_user_avatar
  # Mar 13 - removed this validation because we now register through github
  # validates :first_name, presence: true
  # validates :last_name, presence: true


  def teacher?
    self.technologies.any?
  end

  def self.from_omniauth(auth)
    # binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.info.email.blank?
        user.email = "noemail@found.com"
      else
        user.email = auth.info.email
      end
      user.password = Devise.friendly_token[0,20]
      user.github_avatar_url = auth.extra.raw_info.avatar_url
      user.first_name = auth.info.nickname
      # generate random email if email is empty from auth
    end
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
