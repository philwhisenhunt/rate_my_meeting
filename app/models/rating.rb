class Rating < ApplicationRecord
    belongs_to :user, class_name: "User", optional: true
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :content, presence: true

end
