require 'rails_helper'

describe "User" do
	let!(:user) {User.create(name: "makara",email: "makara@gamil.com",password: "123456789", phone: "092927548", role: "admin")}
	it "can log in" do
		visit new_user_session_path

		fill_in :user_email, with: "makara@gamil.com"
		fill_in :user_password, with: "123456789"
		click_button "Log in"
		expect(current_path).to eq(root_path)
	end
	it "invalid log in " do
		visit new_user_session_path
		fill_in :user_email, with: ''
		fill_in :user_password, with: ''
		click_button "Log in"
		expect(current_path).to eq(current_path)
	end
end