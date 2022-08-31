class Profile < ApplicationRecord
  belongs_to :account
  validates :name, :age, :picture, presence: true
  has_one_attached :picture
end
