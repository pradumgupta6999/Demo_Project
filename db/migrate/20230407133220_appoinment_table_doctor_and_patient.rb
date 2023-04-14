class AppoinmentTableDoctorAndPatient < ActiveRecord::Migration[7.0]
  def change
    create_join_table :patients, :doctors
  end
end
