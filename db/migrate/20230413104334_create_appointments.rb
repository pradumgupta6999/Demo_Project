class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.time :start_time, foreign_key: true
      t.time :end_time, foreign_key: true
      t.references :doctor
      t.references :patient
      t.timestamps
    end
  end
end
