# db/migrate/YYYYMMDDHHMMSS_create_attendances.rb
class CreateAttendances < ActiveRecord::Migration[7.01]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
