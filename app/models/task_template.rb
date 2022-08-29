class TaskTemplate < ApplicationRecord
  belongs_to :account
  has_one :profile_task, dependent: :destroy
  validates :title, :min_age, :weekday, presence: true
end
