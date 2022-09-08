class Chat < ApplicationRecord
  belongs_to :sender_chat, class_name: "Profile"
  belongs_to :receiver_chat, class_name: "Profile"
end
