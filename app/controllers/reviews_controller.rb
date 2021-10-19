class ReviewsController < ApplicationController
  
  def create
    @review = Review.new(review_params)

    @review.user = current_user
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to :back, notice: 'Review submitted!'
    else
      raise @review.inspect
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'Review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
