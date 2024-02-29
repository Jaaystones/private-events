# db/migrate/YYYYMMDDHHMMSS_create_attendances.rb
class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :attended_event, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
