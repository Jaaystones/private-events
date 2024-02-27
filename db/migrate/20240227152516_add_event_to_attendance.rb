class AddEventToAttendance < ActiveRecord::Migration[7.1]
  def change
    add_reference :attendances, :event, null: false, foreign_key: 'event_id'
  end
end
