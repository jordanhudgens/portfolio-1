class BlogsChannel < ApplicationCable::Channel
	def subscribed
		stream_from "blogs_#{params['blog_id']}_channel"
	end

	# user left the page where comment was live
	def unsubscribed
	end

	def send_comment data
		current_user.comments.create!(content: data['comment'], blog_id: data['blod_id'])
	end
end