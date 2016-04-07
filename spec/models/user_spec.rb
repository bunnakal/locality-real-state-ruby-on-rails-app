require 'rails_helper'

describe "User" do
	it "require name " do
		u= User.create(name: "",email: "makara@gamil.com",password: "123456789", phone: "092927548", role: "admin")
		expect(u.valid?).to be false
		expect(u.errors[:name].any?).to be true
	end
	it "require email " do
		u= User.create(name: "Makara",email: "",password: "123456789", phone: "092927548", role: "admin")
		expect(u.valid?).to be false
		expect(u.errors[:email].any?).to be true
	end
	it "require password " do
		u= User.create(name: "Makara",email: "makara@gamil.com",password: "", phone: "092927548", role: "admin")
		expect(u.valid?).to be false
		expect(u.errors[:password].any?).to be true
	end
	it "require phone " do
		u= User.create(name: "Makara",email: "makara@gamil.com",password: "123456789", phone: "", role: "admin")
		expect(u.valid?).to be false
		expect(u.errors[:phone].any?).to be true
	end
end
