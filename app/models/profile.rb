class Profile < ApplicationRecord
  belongs_to :account
  validates :name, :age, :picture, presence: true
  has_one_attached :picture
  has_many :packings
  has_many :profile_tasks
  has_many :votes, class_name: "ActsAsVotable::Vote", as: :voter, dependent: :destroy do
    def votables
      includes(:votable).map(&:votable)
    end
  end
  acts_as_voter

  def progress
    return 0 if profile_tasks.empty?

    done_tasks = profile_tasks.where(done: true).count
    return 0 if done_tasks.zero?

    (done_tasks.to_f / profile_tasks.count) * 100
  end
end
