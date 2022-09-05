class Chat < ApplicationRecord
  belongs_to :sender, class_name: "Profile"
  belongs_to :receiver, class_name: "Profile"
end
