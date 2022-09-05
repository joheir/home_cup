class Meal < ApplicationRecord
  acts_as_votable
  belongs_to :account
  validates :name, :url, :picture_url, presence: true
end
