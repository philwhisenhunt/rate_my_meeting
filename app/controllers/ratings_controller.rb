class RatingsController < ApplicationController

    def average
        #Find the days date
        @ratings = Rating.where(meeting_date: @meeting_date)
        #Find all ratings for that date
        #Add all the ratings together
        @ratings.sum

        #Divide by the number of ratings given
        @ratings / @rating.count
        #Return the average number
    end

    def save
        #Accept the input of the rating
        #Save it to the date of the current date
        day = Time.day
        @meeting_date = day
        @ratings = Rating.where(meeting_date: @meeting_date)

    end

    def update
        # Find the current entry in the database
        @rating = User.rating.where(meeting_date: @meeting_date)
        # Accept the new input of the rating
        # Add the new rating
        # User.rating.where(meeting_date: @meeting_date) = @input

    end
    
        
    def index
        # @users = User.paginate(page: params[:page])
        # @ratings = Rating.paginate(page: params[:page])

        if params[:meeting_date]
            @meeting_date = params[:meeting_date]
            @ratings = Rating.where(meeting_date: @meeting_date).paginate(page: params[:page])
        else
            #Otherwise return everything
            @ratings = nil
        end

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
        # @ratings = Rating.find(params[:id])
        # @users = User.where(activated: true).paginate(page: params[:page])
        # @ratings = Rating.where(meeting_date: "2020-08-06").paginate(page: params[:page])
        # byebug

        # byebug
        # @average = @ratings.average
            if params[:meeting_date]
                @ratings = Rating.where(meeting_date: meeting_date).paginate(page: params[:page])
            else
                @ratings = Rating.first
            end
    



    end

    def new
        #display the page that asks for a rating
        #make a post request to save the new rating
    end
end
