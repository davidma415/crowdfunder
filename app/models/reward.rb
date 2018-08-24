class Reward < ActiveRecord::Base
  validates :description, :dollar_amount, presence: true
  belongs_to :project
end
