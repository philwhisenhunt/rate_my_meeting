class Rating < ApplicationRecord
    belongs_to :user, class_name: "User", optional: true
    default_scope -> { order(created_at: :desc) }
    # validates :user_id, presence: true
    # validates :content, presence: true

    def average(ratings)
        @ratings = ratings
        @ratings_count = @ratings.count
        @ratings.each do |rating|
            @ratings_sum += rating.content
            puts @ratings_sum
        end
   
        @ratings_sum = @ratings.sum
        average = @ratings_sum/@ratings_count
    end


end
