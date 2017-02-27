class Skill < ApplicationRecord
	include Placeholder
	validates :title, :percent_utilized, presence: true
	after_initialize :set_defaults  # This callback runs after the new action

	def set_defaults
		self.badge ||= Placeholder.image_generator(height: 250, width: 250)
	end
end
