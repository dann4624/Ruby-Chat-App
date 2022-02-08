class User < ApplicationRecord
    has_many :messages, dependent: :delete_all
    validates_uniqueness_of :username
    after_create_commit { broadcast_append_to "users" }
    after_destroy_commit { broadcast_remove_to "users" }
    scope :all_except, ->(user) { where.not(id: user) }

end
