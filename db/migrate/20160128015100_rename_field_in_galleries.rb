class RenameFieldInGalleries < ActiveRecord::Migration
  def change
  	rename_column :galleries, :image, :image_gallery
  end
end
