class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: {message: 'body has to be present'}
end
