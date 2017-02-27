class Portfolio < ApplicationRecord
	include Placeholder
	validates :title, :body, :main_image, :thumb_image, presence: true
	has_many :technologies
	accepts_nested_attributes_for :technologies, reject_if: lambda { |attr| attr['name'].blank? }

	def self.angular
		where(subtitle: 'Angular')
	end

	scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

	after_initialize :set_defaults  # This callback runs after the new action

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: 600, width: 400) 
		self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
	end
end
