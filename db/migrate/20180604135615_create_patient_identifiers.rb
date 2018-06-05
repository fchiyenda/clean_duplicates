class CreatePatientIdentifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_identifiers do |t|
      t.integer :patient_identifier_id
      t.integer :patient_id
      t.text :identifier
      t.integer :identifier_type
      t.integer :preferred
      t.integer :location_id
      t.integer :creator
      t.datetime :date_created
      t.integer :voided
      t.integer :voided_by
      t.datetime :date_voided
      t.text :void_reason
      t.text :uuid

      t.timestamps
    end
  end
end
