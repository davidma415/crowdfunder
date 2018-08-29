class Comment < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :project
  belongs_to :user
end
