class RatingsController < ApplicationController

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
            @number = Rating.where(meeting_date: @meeting_date).count
            if @number > 0
                @average = Rating.avg(@meeting_date)
            end            
            @ratings = Rating.where(meeting_date: @meeting_date).paginate(page: params[:page])

        else
            @ratings = Rating.all.paginate(page: params[:page]).limit(50)
            @average = "No ratings yet"
           
            # render 'fragment' #todo: add file piece the include here
            # Include a link to a rate now button
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
        attempted_date = @rating.meeting_date
        # User.ratings.where(meeting_date: attempted_date)
        byebug
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
