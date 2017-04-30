module SetSource
	extend ActiveSupport::Concern

	included do 
  		before_filter :set_source # same as before_action
	end

  	def set_source
  		session[:source] = params[:q] if params[:q]
  	end
end