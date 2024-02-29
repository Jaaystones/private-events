class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :user_must_exist
  validate :event_must_exist

  private

  def user_must_exist
    errors.add(:user_id, 'is not valid') unless user.present?
  end

  def event_must_exist
    errors.add(:event_id, 'is not valid') unless event.present?
  end
end
