class CreatePersonNames < ActiveRecord::Migration[5.0]
  def change
    create_table :person_names do |t|
      t.integer :person_name_id
      t.integer :preferred
      t.integer :person_id
      t.text :prefix
      t.text :given_name
      t.text :middle_name
      t.text :family_name_prefix
      t.text :family_name
      t.text :family_name2
      t.text :family_name_suffix
      t.text :degree
      t.integer :creator
      t.datetime :date_created
      t.integer :voided
      t.integer :voided_by
      t.datetime :date_voided
      t.text :void_reason
      t.integer :changed_by
      t.datetime :date_changed
      t.text :uuid

      t.timestamps
    end
  end
end
