class Update < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, :description, presence: true
end
