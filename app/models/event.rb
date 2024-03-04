# app/models/event.rb
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  validates :name, :location, :date, presence: true

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :public_events, -> { where(private: false) }
end
