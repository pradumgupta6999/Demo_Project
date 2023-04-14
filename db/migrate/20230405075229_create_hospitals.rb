class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :hospital_name
      t.integer :mobile
      t.string :address
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
