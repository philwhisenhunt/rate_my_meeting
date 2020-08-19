class RatingsController < ApplicationController

    def average
        #Find the days date
        @meeting_date = params # add params here
        @ratings = Rating.where(meeting_date: @meeting_date)
        #Find all ratings for that date
        #Add all the ratings together
        @ratings.sum

        #Divide by the number of ratings given and Return the average number
        @daily_average = @ratings / @rating.count

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
        
        if params[:meeting_date]
            @ratings = Rating.where(meeting_date: meeting_date).paginate(page: params[:page])
        else
            @ratings = Rating.first
        end

    end

    def new
        #display the page that asks for a rating
        #make a post request to save the new rating
        @rating = current_user.ratings.new
    end

    def create
        @rating = current_user.ratings.new(rating_params)
        # byebug
        if @rating.save
            flash[:success] = "Rating created!"
            redirect_to root_url
        else
            flash[:error] = "Rating was not saved"
            redirect_to root_url

        end
    end

    private

 
    def rating_params
        params.require(:rating).permit(:rating, :meeting_date)
    end
end
