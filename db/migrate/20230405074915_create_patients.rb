class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :patient_name
      t.integer :mobile
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
