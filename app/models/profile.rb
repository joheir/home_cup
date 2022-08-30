class Profile < ApplicationRecord
  belongs_to :account
  validates :name, :admin, :age, :picture, presence: true
  has_one_attached :photo
end
