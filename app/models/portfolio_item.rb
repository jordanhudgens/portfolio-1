class PortfolioItem < ApplicationRecord

	# upload
	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

  # relations
	has_many :technologies

  # nested attributes (must be placed below relations)
  accepts_nested_attributes_for :technologies, 
  															allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

	# validations
	validates_presence_of :title, :body

	# class methods
	def self.by_position
		order("position ASC")
	end
end
