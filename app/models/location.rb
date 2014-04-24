class Location < ActiveRecord::Base
	belongs_to :wildfire

	## SCOPES ##   #if argument being passed then use method, if not then use scope
	# scope :georgia, -> { where(state: "GA" OR state: "Georgia")}
	# scope :with_specialty, ->(specialty) { where('specialty = ?', specialty) }


end
