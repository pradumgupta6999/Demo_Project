class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :patient_disease
      t.string :suffering_period
      t.string :height
      t.string :weight
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
