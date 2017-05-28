class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, 
  					presence: true, length: { minimum: 1, maximum: 200 }

  # defer, wait a little bit to perform					
  after_create_commit { CommentBroadcastJob.perform_later(self) }					
end
