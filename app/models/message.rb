class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_to self.room }
  after_destroy_commit { broadcast_remove_to self.room }
end
