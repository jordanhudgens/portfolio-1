class PortfolioItem < ApplicationRecord
	# includes
	include Placeholder

  # relations
	has_many :technologies

  # nested attributes (must be placed below relations)
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

	# validations
	validates_presence_of :title, :body, :main_image, :thumb_image

	# custom scopes
	scope :ror_portfolio_items, -> { where(subtitle: "RoR") }


	# callbacks
	after_initialize :set_defaults


	# class methods
	def self.angular_portfolio_items
		where(subtitle: "Angular")
	end


	# object methods
	def set_defaults
		self.main_image ||= Placeholder.image_generator(600,400) # set value if nil
		self.thumb_image ||= Placeholder.image_generator(350,200)
	end
end
