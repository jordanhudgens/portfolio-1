module DefaultPageContent
	extend ActiveSupport::Concern

	included do 
  	before_filter :set_title
	end


  def set_title
  	@page_title = "Milan's Blog"
  	@seo_keywords = "Milan Ruby Rails"
  end
end