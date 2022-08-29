class Profile < ApplicationRecord
  belongs_to :account
  validates :name, :admin, :age, :picture, presence: true
end
