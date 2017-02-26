class Portfolio < ApplicationRecord
	validates :title, :body, :main_image, :thumb_image, presence: true

	def self.angular
		where(subtitle: 'Angular')
	end

	scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
end
