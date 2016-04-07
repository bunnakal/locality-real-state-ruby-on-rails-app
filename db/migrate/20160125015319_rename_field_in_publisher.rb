class RenameFieldInPublisher < ActiveRecord::Migration
  def change
  	rename_column :publishers, :password, :encrypted_password
  end
end
