class Todo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :todo_type, optional: true
  belongs_to :user, optional: true
  validates :title, presence: true

  before_create :default_status

  def done?
    self.status == 'done'
  end

  def status_badge
    self.done? ? "success" : "danger"
  end

  private 

    def default_status
      self.status = 'pending'
    end

end
