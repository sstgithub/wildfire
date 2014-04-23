class Wildfire < ActiveRecord::Base

	has_many :locations

	def self.search(query)
  	Wildfire.joins(:locations).where("locations.wildfire_id like ? OR locations.state like ? OR locations.city like ? OR area_burned like ? OR description like ?",  "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end
end
