module PortfolioItemsHelper
	def image_generator width, height
		"http://placehold.it/#{width}x#{height}"
	end

	def portfolio_img_helper img, type
		if img.model.thumb_image? || img.model.main_image?
			img
		elsif type == 'thumb'
			image_generator(350,200)
		else
			image_generator(400,600)	
		end	
	end
end

