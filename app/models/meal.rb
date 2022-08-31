class Meal < ApplicationRecord
  belongs_to :account
  validates :name, :url, :picture_url, presece: true
end
