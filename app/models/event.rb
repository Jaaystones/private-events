class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  # Scope for past events
  def self.past
    where('date < ?', Date.today)
  end
  # Scope for upcoming events
  def self.upcoming
    where('date >= ?', Date.today)
  end
end
  