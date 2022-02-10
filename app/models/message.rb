class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_later_to self.room }
  after_update_commit { broadcast_update_later_to(user,:messages, target: "message-count") }
  after_destroy_commit { broadcast_remove_to self.room, :messages}
end
