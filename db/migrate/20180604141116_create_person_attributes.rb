class CreatePersonAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :person_attributes do |t|
      t.integer :person_attribute_id
      t.integer :person_id
      t.text :value
      t.integer :person_attribute_type_id
      t.integer :creator
      t.datetime :date_created
      t.integer :changed_by
      t.datetime :date_changed
      t.integer :voided
      t.integer :voided_by
      t.datetime :date_voided
      t.text :voided_reason
      t.text :uuid

      t.timestamps
    end
  end
end
