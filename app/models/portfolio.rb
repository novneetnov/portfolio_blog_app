class Portfolio < ApplicationRecord
	validates :title, :body, :main_image, :thumb_image, presence: true

	def self.angular
		where(subtitle: 'Angular')
	end

	scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

	after_initialize :set_defaults  # This callback runs after the new action

	def set_defaults
		self.main_image ||= "http://placehold.it/600x400" 
		self.thumb_image ||= "http://placehold.it/350x200" 
	end
end
