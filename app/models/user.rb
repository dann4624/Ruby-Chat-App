class User < ApplicationRecord
    has_many :messages, dependent: :delete_all
    validates_uniqueness_of :username, :email
    after_create_commit { broadcast_append_to "users" }
    scope :all_except, ->(user) { where.not(id: user) }

end
