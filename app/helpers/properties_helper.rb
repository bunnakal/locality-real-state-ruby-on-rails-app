module PropertiesHelper
	def display_for_bed(property)
		if property.beds.blank?
			return "N/A"
		else
			return property.beds
		end
	end
	def display_for_bath(property)
		if property.baths.blank?
			return "N/A"
		else
			return property.baths
		end
	end
end
