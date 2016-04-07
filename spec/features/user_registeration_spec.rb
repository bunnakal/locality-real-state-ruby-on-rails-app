require 'rails_helper'

describe "User registeration" do
	it "can register " do
		visit new_user_registration_path
		fill_in :user_name, with: "Makara"
		fill_in :user_email, with: "makara@gmail.com"
		fill_in :user_password, with: "123456789"
		fill_in :user_password_confirmation, with: "123456789"
		attach_file :user_avatar,"spec/support/uploads/1.jpg"
		fill_in :user_phone, with: "092927548"
		hidden_field = find :xpath, "//input[@id='user_role']"
		hidden_field.set "admin"
		click_button "Create User"

		expect(current_path).to eq(root_path)
	end
end