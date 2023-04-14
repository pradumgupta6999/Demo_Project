class JoinDoctorHospital < ActiveRecord::Migration[7.0]
  def change
    create_join_table :doctors, :hospitals
  end
end
