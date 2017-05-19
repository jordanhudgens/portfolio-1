class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
  	@copyright = MilanPortfolioCopyright::Renderer.copyright("Milan", "IT370 projekat")
  end

end
