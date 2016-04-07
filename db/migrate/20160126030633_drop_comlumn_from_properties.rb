class DropComlumnFromProperties < ActiveRecord::Migration
  def change
  	remove_column :properties, :publisher_id
  end
end
