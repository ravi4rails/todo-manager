class User < ApplicationRecord

  has_many :todos

  validates :first_name, :last_name, presence: true
  validates :contact, :username, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
