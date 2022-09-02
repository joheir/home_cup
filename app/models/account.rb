class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :profiles
  has_many :profile_tasks, through: :profiles
  has_many :task_templates
  has_many :meals

  def done_tasks_count
    return 0 if task_templates.empty?

    done_tasks_total = profiles.profile_tasks.where(done: true).count
    return 0 if done_tasks_total.zero?

    (done_tasks_total.to_f/task_templates.count) * 100
  end
end
