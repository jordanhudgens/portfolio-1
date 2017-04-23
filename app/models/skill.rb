class Skill < ApplicationRecord
	# includes
	include Placeholder

  	validates_presence_of :title, :percent_utilized

  	# callbacks
  	after_initialize :set_defaults

  	# object methods
  	def set_defaults
  		self.badge ||= Placeholder.image_generator(250,250) # set value if nil, calling method from concern
  	end
end
