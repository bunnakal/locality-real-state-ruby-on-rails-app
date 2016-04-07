require 'rails_helper'

def create_property
	u=User.create(name: "makara",email: "makara@gamil.com",password: "123456789", phone: "092927548", role: "admin")
	t = Type.create(property_type: "Land")
	pro = Property.create(title: "Land For Sale", description: "It’s approximately 1Km far from Royal Cambodia P.P. Golf Club Feature: Growing population area, farm land next to the village, ... Surrounding: Royal Cambodia Phnom Penh Golf Club, Wat Anhchanh Thmei, National Polytechnic Institute of Cambodia, An Doung Ta Orn Village, Ak Romdoul Village, Tropang Angchanh Village",status: "Sale",price: 28, spec: "2795 Sqm ",address: "Andoung Ta Orn, Samrong Kraom, Por Senchey, Phnom Penh",type_id:t.id,user_id: u.id)
end