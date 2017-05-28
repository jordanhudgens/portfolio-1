class CommentBroadcastJob < ApplicationJob
	# list of comments, served by order
	queue_as :default

	# broadcast a channel (blog_id_channel) on actioncable
	def perform(comment)
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

	private

	def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end