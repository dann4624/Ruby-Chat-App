class Room < ApplicationRecord
    validates_uniqueness_of :title
    after_create_commit {broadcast_append_to "rooms"}
    has_many :messages, dependent: :delete_all

    validates :title, presence: true, length: { minimum: 1, maximum: 255 }
    validates :description, presence: true, length: { minimum: 1, maximum: 255 }
end
