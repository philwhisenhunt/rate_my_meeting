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
end
