class DeleleLatLongField < ActiveRecord::Migration
  def change
  	remove_column :properties, :latlong
  end
end
