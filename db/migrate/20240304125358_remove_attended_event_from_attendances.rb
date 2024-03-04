class RemoveAttendedEventFromAttendances < ActiveRecord::Migration[7.1]
  def change
    remove_reference :attendances, :attended_event, foreign_key: { to_table: :events }
  end
end
