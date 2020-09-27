class RatingsController < ApplicationController
    before_action :get_rating, only: [:edit, :update]


    def update
        # Find the current entry in the database
        # @meeting_date = params[:meeting_date]
            # @rating = current_user.ratings.where(meeting_date: @meeting_date)
        @meeting_date = @rating.meeting_date
      
        if @rating.update(rating_params)            
           
            redirect_to ratings_path(meeting_date: @rating.meeting_date)
        else
            flash[:danger] = "Rating was not updated"
            render :edit
        end
        # Accept the new input of the rating
        # Add the new rating
        # User.rating.where(meeting_date: @meeting_date) = @input

    end
    # Add an edit view
    def edit
        #
        @meeting_date = @rating.meeting_date
    end

    
        
    def index
     
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
        end

    end

    def show
        
        # if params[:meeting_date]
        #     @ratings = Rating.where(meeting_date: meeting_date).paginate(page: params[:page])
        #     @number = Rating.where(meeting_date: @meeting_date).count

        # else
        #     @ratings = Rating.all.limit(30)
        # end

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
        # byebug
        # if Rating.where(meeting_date: attempted_date).count > 0
        #     # byebug
        #     flash[:danger] = "You've already rated this meeting."
        #     redirect_to '/ratings/new'
        if @rating.save
            flash[:success] = "Rating created!"
            redirect_to root_url + 'ratings' + "?meeting_date=" + "#{@rating.meeting_date}"
        else
            flash[:danger] = "Rating was not saved"
            render :new
        end
    end

    private
    def get_rating
        @rating = current_user.ratings.find(params[:id])
    end

 
    def rating_params
        params.require(:rating).permit(:rating, :meeting_date)
    end
end
