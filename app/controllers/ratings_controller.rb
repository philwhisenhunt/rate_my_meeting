class RatingsController < ApplicationController

    def average
        #Find the days date
        
        #Find all ratings for that date
        #Add all the ratings together
        #Divide by the number of ratings given
        #Return the average number
    end

    def save
        #Accept the input of the rating
        #Save it to the date of the current date
        day = Time.day
    end

    def update
        # Find the current entry in the database
        # Accept the new input of the rating
        # Add the new rating
    end
    
        
    def index
        # @users = User.paginate(page: params[:page])
        @ratings = Rating.paginate(page: params[:page])
    end

    def show
        # @users = User.paginate(page: params[:page])

        # @ratings = Rating.paginate(meeting_date: params[:meeting_date])
        # # @ratings = Rating.paginate(page: params[:meeting_date])
        # byebug
        # @ratings = Rating.paginate(page: params[:page])
        # @rating = Rating.
        # @ratings = Rating.find(meeting_date: params[:meeting_date])
        # @ratings = Rating.find(:id)
        # @user = User.find(params[:id])
        @ratings = Rating.find(params[:id])
        byebug



    end
end
