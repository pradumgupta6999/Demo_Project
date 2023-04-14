class AddColumnToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :start_time, :time
    add_column :doctors, :end_time, :time
    add_column :doctors, :appointment_date,:date
  end
end
