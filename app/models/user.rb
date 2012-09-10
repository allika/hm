class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :created_at, :updated_at #, :remember_me
  # attr_accessible :title, :body

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  before_save { |user| user.email = email.downcase }

  validates :email, :presence => true, :length => { :maximum => 60 },
            :format => EMAIL_REGEX
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
end
