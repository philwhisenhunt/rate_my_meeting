class RatingsController < ApplicationController

    def average
        #Find the days date
        
        @meeting_date = params[:meeting_date] # add params here
        @ratings = Rating.where(meeting_date: @meeting_date)
        #Find all ratings for that date
        #Add all the ratings together
        byebug
        @ratings.sum

        #Divide by the number of ratings given and Return the average number
        @daily_average = @ratings / @rating.count

    end

    def save
        #Accept the input of the rating
        #Save it to the date of the current date
     
        if Rating.where(meeting_date: @meeting_date)
            #overwrite it
            #Display Updated rating
        else
            day = Time.day
            @meeting_date = day
            @ratings = User.ratings.where(meeting_date: @meeting_date)
    
        end
        #otherwise just save it and flash saved rating

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
            # my_array = []
            # @ratings.each do |thing|
            #    my_array.push(thing.rating)
            # end
            # total = 0
            # my_array.each do |piece|
            #     total = total + piece
            # end
            # if my_array.count > 0
            #     @average = total / my_array.count
            # else
            #     @average = "N/A"
            # end
           @rating = @rating.average
            
        else
            #Otherwise return everything
            render 'fragment' #todo: add file piece the include here
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
        if current_user
            @rating = current_user.ratings.new
        
        else
            redirect_to login_url

        end
    end

    def create
        

        @rating = current_user.ratings.new(rating_params)
        # byebug
        if @rating.save
            # byebug
            flash[:success] = "Rating created!"
            redirect_to root_url + 'ratings' + "?meeting_date=" + "#{@rating.meeting_date}"
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
