class ProfileTask < ApplicationRecord
  belongs_to :profile
  belongs_to :task_template
end
