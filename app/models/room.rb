class Room < ApplicationRecord
    validates_uniqueness_of :title
    after_create_commit {broadcast_append_to "rooms"}
    after_update_commit { broadcast_replace_to "rooms" }
    after_destroy_commit { broadcast_remove_ "rooms" }
    has_many :messages, dependent: :delete_all

    validates :title, presence: true, length: { minimum: 1, maximum: 255 }
    validates :description, presence: true, length: { minimum: 1, maximum: 255 }
end
