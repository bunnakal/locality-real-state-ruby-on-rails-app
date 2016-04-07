require 'rails_helper'
def login
	User.create(name: "makara",email: "makara@gamil.com",password: "123456789", phone: "092927548", role: "admin")
	visit new_user_session_path
	fill_in :user_email, with: "makara@gamil.com"
	fill_in :user_password, with: "123456789"
	click_button "Log in"
	expect(current_path).to eq(root_path)
end