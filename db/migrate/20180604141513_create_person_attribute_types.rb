class CreatePersonAttributeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :person_attribute_types do |t|
      t.integer :person_attribute_type_id
      t.text :name
      t.text :description
      t.text :format
      t.integer :foreign_key
      t.integer :searchable
      t.integer :creator
      t.datetime :date_created
      t.integer :changed_by
      t.datetime :date_changed
      t.integer :retired
      t.integer :retired_by
      t.datetime :date_retired
      t.text :retire_reason
      t.text :edit_privilege
      t.text :uuid
      t.string :sort_weight

      t.timestamps
    end
  end
end
