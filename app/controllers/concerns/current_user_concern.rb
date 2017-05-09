module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
  	super || guest_user # if logged in it will use super
  end

  def guest_user
  	OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "example@example.com")
  end

end