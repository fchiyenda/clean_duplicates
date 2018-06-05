class CreateGlobalProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :global_properties do |t|
      t.binary :property
      t.text :property_value
      t.text :description
      t.text :uuid

      t.timestamps
    end
  end
end
