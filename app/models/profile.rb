class Profile < ApplicationRecord
  belongs_to :account
  validates :name, :admin, :age, :picture, presence: true
  has_one_attached :picture

  def progress
    profile_tasks = ProfileTask.where(profile_id: id)
    count = 0
    profile_tasks.each do |profile_task|
      profile_task.done? ? count += 1 : count
    end

    (count.to_f / profile_tasks.length) * 100
  end
end
