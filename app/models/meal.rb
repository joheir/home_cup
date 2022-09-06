class Meal < ApplicationRecord
  acts_as_votable
  has_many :votes,  as: :votable
  belongs_to :account
  validates :name, :url, :picture_url, presence: true
  attr_accessor :ingredient

end
