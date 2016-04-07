require 'rails_helper'
describe "User create property" do
	let!(:user) {User.create(name: "makara",email: "makara@gamil.com",password: "123456789", phone: "092927548", role: "admin")}
	it "require login and create property" do
		t = Type.create(property_type: "House")
		login
		visit new_user_property_path(user)

		fill_in :property_title, with: 'House for rent'
		fill_in :property_description, with: 'Rails Project Week : Location Location Location Project Exercise for students on DevBootstrap 2016.Q1 program'
		find(:select, :property_status).first(:option, "Rent").select_option
		fill_in :property_price, with: 12000000
		find(:select, :property_type_id).first(:option, "House").select_option
		fill_in :property_spec, with: '5X12'
		fill_in :autocomplete, with: "Phnom Penh"
		attach_file :property_image,"spec/support/uploads/1.jpg"
		attach_file :property_property_galleries_image_gallery, "spec/support/uploads/1.jpg"

		click_button "Create Property"

		expect(page).to have_text('House for rent')
	end
end