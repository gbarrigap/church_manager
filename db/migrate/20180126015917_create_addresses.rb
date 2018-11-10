class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_name, null: false
      t.integer :street_number, null: false
      t.string :reference
      t.string :zip_code
      t.decimal :latitude, precision: 10, scale: 4
      t.decimal :longitude, precision: 10, scale: 4
      t.references :commune, foreign_key: true
      t.references :church, foreign_key: true

      t.timestamps
    end
  end
end
