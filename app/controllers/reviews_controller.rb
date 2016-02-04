class ReviewsController < ApplicationController
 before_filter :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]



  respond_to :html 

  def index
    id = params[:id]
     @reviews = Review.where(user_id: id)

    end

  def show
    respond_with(@reviews)
  end

  def new
     @review = Review.new
    id = params[:id]
    name = params[:name]
  @review.user_id = id
  @review.productname = name
    
    respond_with(@review)
  end

  def edit
  end

  def create
    review_params[:reviwtext] = ProfanityWords.swapProfanity(review_params[:reviwtext] )
    @review = Review.new(review_params)

    @review.save
    respond_with(@review)
  end

  def update
    review_params[:reviwtext] = ProfanityWords.swapProfanity(review_params[:reviwtext] )
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review

      @review = Review.find(params[:id])
      

    end

    def review_params
      params.require(:review).permit(:productname, :reviwtext, :itemrate, :user_id)
    end
end
