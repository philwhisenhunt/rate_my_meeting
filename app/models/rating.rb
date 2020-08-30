class Rating < ApplicationRecord
    belongs_to :user, class_name: "User", optional: true
    default_scope -> { order(created_at: :desc) }
    # validates :user_id, presence: true
    # validates :content, presence: true

    def average
        # @ratings = ratings
        # @ratings_count = @ratings.count
        # @ratings.each do |rating|
        #     @ratings_sum += rating.content
        #     puts @ratings_sum
        # end
   
        # @ratings_sum = @ratings.sum
        # average = @ratings_sum/@ratings_count


        my_array = []
        @ratings.each do |thing|
           my_array.push(thing.rating)
        end
        total = 0
        my_array.each do |piece|
            total = total + piece
        end
        if my_array.count > 0
            @average = total / my_array.count
        else
            @average = "N/A"
        end
    end


end
