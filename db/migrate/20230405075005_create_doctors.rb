class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :doctor_name
      t.integer :mobile
      t.string :address
      t.string :specilization
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
