require 'rails_helper'

describe "Property Update" do
	it "update the property" do 
		create_property
		login
		visit edit_property_path(create_property)
		fill_in :property_title, with: 'House Khmer'
		fill_in :property_description, with: 'Rails Project Week : Location Location Location Project Exercise for students on DevBootstrap 2016.Q1 program'
		find(:select, :property_status).first(:option, "Sale").select_option
		fill_in :property_price, with: 12000000
		# find(:select, :property_type_id).first(:option, "House").select_option
		fill_in :property_spec, with: '5X12'
		fill_in :autocomplete, with: "Phnom Penh"
		attach_file :property_image,"spec/support/uploads/1.jpg"
		attach_file :property_property_galleries_image_gallery, "spec/support/uploads/1.jpg"

		click_button "Update Property"

		expect(page).to have_text('House Khmer')
	end
end