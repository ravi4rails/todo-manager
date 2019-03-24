class Todo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :todo_type, optional: true
  belongs_to :user, optional: true
  validates :title, presence: true

  before_create :default_status

  private 

    def default_status
      self.status = 'pending'
    end

end
