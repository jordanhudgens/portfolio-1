module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user

  	def guest_user
  		guest = GuestUser.new
  		guest.id = guest.object_id # object_id stored in memory
  		guest.name = "Guest User"
  		guest.first_name = "Guest"
  		guest.last_name = "User"
  		guest.email = "guest@user.com"
  		guest
  	end

  	def connect
  		self.current_user = find_verified_user || guest_user
  		# when connection occurs print 
  		logger.add_tags 'ActionCable', current_user.email
  		logger.add_tags 'ActionCable', current_user.id
  	end

  	private

  	def find_verified_user
  		if verified_user = env['warden'].user
  			verified_user
  		end
  	end
  end
end
