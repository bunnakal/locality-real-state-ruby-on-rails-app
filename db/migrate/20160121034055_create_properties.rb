class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :status
      t.decimal :price
      t.integer :beds
      t.integer :baths
      t.string :spec
      t.string :state
      t.string :district
      t.string :address
      t.string :latlong
      t.references :type, index: true, foreign_key: true
      t.references :publisher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
