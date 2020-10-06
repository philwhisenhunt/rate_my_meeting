class Rating < ApplicationRecord
    belongs_to :user, class_name: "User", optional: true
    default_scope -> { order(created_at: :desc) }
    # validates :user_id, presence: true
    # validates :content, presence: true
    validates :rating, presence: true
    validate :only_one_meeting_per_day, on: :create
    #Add restriction for editing ratings for other days
    validate :only_edit_current_day, on: :update

    def self.avg(date)
        self.where(meeting_date: date).average(:rating)
    end

    def only_one_meeting_per_day
        ratings = Rating.where(user:self.user, meeting_date: self.meeting_date)
        if ratings.count > 0
        #  if Rating.where(user:self.user, meeting_date: self.meeting_date).count > 0
            errors.add(:meeting_date, "This day's meeting already has a rating from you.")
            #Iterate over this errors array. 
            # Confirm this works 
         end
    end

    def only_edit_current_day
        #if rating meeting_date Date.today
        

        if meeting_date != Time.now.strftime('%Y-%m-%d')
            errors.add(:meeting_date, "You can only today's meeting rating.")
        end
        #   give an error
    end
    # def average(ratings)
    #     # @ratings = ratings
    #     # @ratings_count = @ratings.count
    #     # @ratings.each do |rating|
    #     #     @ratings_sum += rating.content
    #     #     puts @ratings_sum
    #     # end
   
    #     # @ratings_sum = @ratings.sum
    #     # average = @ratings_sum/@ratings_count

    #     byebug
    #     my_array = []
    #     ratings.each do |rating|
    #        my_array.push(rating.rating)
    #     end
    #     total = 0
    #     my_array.each do |piece|
    #         total = total + piece
    #     end
    #     if my_array.count > 0
    #         @average = total / my_array.count
    #     else
    #         @average = "N/A"
    #     end
    # end


end
