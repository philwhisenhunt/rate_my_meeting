class Rating < ApplicationRecord
    # validates :rating, presence: true
    # validates :rating, numericality: {only_integer: true}
    belongs_to :user
    validates :user_id, presence: true
    validates :rating, presence: true, numericality: {only_integer: true}

end
