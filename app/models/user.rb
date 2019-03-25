class User < ApplicationRecord

  has_many :todos

  validates :first_name, :last_name, presence: true
  validates :contact, :username, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def all_todos
    self.todos
  end       

  def pending_todos
    self.todos.where(status: 'pending')
  end

  def completed_todos
    self.todos.where(status: 'done')
  end
  
end
