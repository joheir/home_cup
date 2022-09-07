class Meal < ApplicationRecord
  acts_as_votable
  has_many :votes, class_name: "ActsAsVotable::Vote", as: :votable, dependent: :destroy
  belongs_to :account
  validates :name, :url, :picture_url, presence: true
end
