class Rating < ApplicationRecord
    
    belongs_to :user
    validates :user_id, presence: true
    validates :rating, presence: true, numericality: {only_integer: true}

end
