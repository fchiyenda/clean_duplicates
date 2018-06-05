class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.integer :person_id
      t.text :gender
      t.datetime :birthdate
      t.integer :birthdate_estimated
      t.integer :dead
      t.datetime :death_date
      t.text :cause_of_death
      t.integer :creator
      t.timestamp :date_created
      t.integer :changed_by
      t.datetime :date_changed
      t.integer :voided
      t.integer :voided_by
      t.datetime :date_voided
      t.text :void_reason
      t.text :uuid
      t.timestamps
    end
  end
end
