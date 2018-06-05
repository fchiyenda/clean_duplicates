class CreatePatientIdentifierTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_identifier_types do |t|
      t.integer :patient_identifier_type_id
      t.text :name
      t.text :description
      t.text :format
      t.integer :check_digit
      t.integer :creator
      t.datetime :date_created
      t.integer :required
      t.text :format_description
      t.text :validator
      t.integer :retired
      t.integer :retired_by
      t.datetime :date_retired
      t.text :retire_reason
      t.text :uuid

      t.timestamps
    end
  end
end
