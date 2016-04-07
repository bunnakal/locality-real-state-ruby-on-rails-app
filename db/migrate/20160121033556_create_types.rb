class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :property_type
      t.text :description

      t.timestamps null: false
    end
  end
end
