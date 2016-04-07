class AddFieldToPublishers < ActiveRecord::Migration
  def change
    add_column :publishers, :salt, :string
  end
end
