class CreatePersonAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :person_addresses do |t|
      t.integer :person_address_id
      t.integer :person_id
      t.integer :preferred
      t.text :address1
      t.text :address2
      t.text :city_village
      t.text :state_province
      t.text :postal_code
      t.text :country
      t.text :latitude
      t.text :longitude
      t.integer :creator
      t.datetime :date_created
      t.integer :voided
      t.integer :voided_by
      t.datetime :date_voided
      t.integer :voided_by
      t.datetime :date_voided
      t.text :voided_reason
      t.text :county_district
      t.text :neighborhood_cell
      t.text :region
      t.text :subregion
      t.text :township_division
      t.text :uuid

      t.timestamps
    end
  end
end
