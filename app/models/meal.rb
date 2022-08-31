class Meal < ApplicationRecord
  belongs_to :account
  validates :name, :url, :picture_url, presence: true
end
