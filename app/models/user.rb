class User < ApplicationRecord

  has_many :posts
  enum role: [:user, :admin]
  validates :name, presence: true
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  before_create do
    self.name= name.capitalize
  end
  
  after_initialize :set_default_role
  def set_default_role
    self.role||= :user
  end
  
end
