class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :post, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :following_users, through: :followings, source: :following_user
  has_many :reverse_followings, foreign_key: :following_user_id, class_name: "Following"
  has_many :followers, through: :reverse_followings, source: :user

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where([ "lower(username) = :value OR lower(email) = :value", { value: login.downcase } ]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
