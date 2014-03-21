class Grunt < ActiveRecord::Base
  belongs_to :user
  delegate :email, to: :user

  def self.recent
    order(created_at: :desc)
  end

  validates :body, length: { maximum: 140}
end
