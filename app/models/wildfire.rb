class Wildfire < ActiveRecord::Base

	has_many :locations

	## SCOPES ##   #if argument being passed then use method, if not then use scope
	scope :still_burning, -> { where(currently_active: true)}
	scope :not_burning, -> { where(currently_active: false)}
	# scope :with_specialty, ->(specialty) { where('specialty = ?', specialty) }

	def self.with_city(city)
		where('locations.city = ?', city)
	end

	def self.with_state(state)
		where('locations.state = ?', state)
	end

	def self.search(params)
		description = params[:description]
		state = params[:state]
		city = params[:city]

		search = Wildfire.all



		if params[:city].present?
			search = search.with_city(city)
		end

		if params[:state].present?
			search = search.with_state(state)
		end

		if params[:current] == "Yes"
			search = search.still_burning
		elsif params[:current] == "No"
			search = search.not_burning
		end

		if params[:description].present?
			search = search.where('description LIKE ?', "%#{description}%")
			# search = joins(:locations).where('description LIKE ?', "%#{description}%")
		end

		# if name.present?
		# 	# search = search.where('patients.name LIKE ?', "%#{name}%")
		# 	search = joins(:patients).where('patients.name LIKE ?', "%#{name}%")
		# end

		search

		# with_specialty(specialty).where('name LIKE ?', "%#{name}%")
	end

	# def self.search(query)
 #  	Wildfire.joins(:locations).where("locations.wildfire_id like ? OR locations.state like ? OR locations.city like ? OR area_burned like ? OR description like ?",  "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	# end
end
