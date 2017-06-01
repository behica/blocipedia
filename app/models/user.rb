class User < ActiveRecord::Base
  has_many :wikis, through: :collaborators
  has_many :collaborators, dependent: :destroy
  
  before_save { self.email = email.downcase }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]
  after_initialize { self.role ||= :standard }
end
