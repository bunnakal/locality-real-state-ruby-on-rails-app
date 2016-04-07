class Type < ActiveRecord::Base
	has_many :properties
	validates :property_type, presence: true
end
