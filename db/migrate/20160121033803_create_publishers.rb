class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :password
      t.string :role

      t.timestamps null: false
    end
  end
end
