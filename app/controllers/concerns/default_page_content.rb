module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_filter :set_page_defaults
	end

	def set_page_defaults
		@page_title = "TechieNov | My Portfolio website"
		@seo_keywords = "Techienov Portfolio"
	end
end
