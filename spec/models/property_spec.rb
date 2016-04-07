require 'rails_helper'

describe "A Property" do
	it "require a title" do
		property = Property.new(title: "")
		expect(property.valid?).to be false
		expect(property.errors[:title].any?).to be true
	end
	it "require description" do
		property = Property.new(description: "")
		expect(property.valid?).to be false
		expect(property.errors[:description].any?).to be true
	end
	it "require status" do
		property = Property.new(status: "")
		expect(property.valid?).to be false
		expect(property.errors[:status].any?).to be true
	end
	it "require price" do
		property = Property.new(price: nil)
		expect(property.valid?).to be false
		expect(property.errors[:price].any?).to be true
	end
	it "require spec" do
		property = Property.new(spec: "")
		expect(property.valid?).to be false
		expect(property.errors[:spec].any?).to be true
	end
	it "require address" do
		property = Property.new(address: "")
		expect(property.valid?).to be false
		expect(property.errors[:address].any?).to be true
	end
end