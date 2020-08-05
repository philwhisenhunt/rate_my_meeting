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
    
        
    def show
        #Get the user
        @user = User.find(params[:id])
        # Get the rating by the users id
        @ratings = User.find(params[:id]).ratings
    end
end
