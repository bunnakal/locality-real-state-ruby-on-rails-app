require 'rails_helper'

describe "A type" do
	it "require a property type " do
		t = Type.new(property_type: "")
		expect(t.valid?).to be false
		expect(t.errors[:property_type].any?).to be true
	end
end