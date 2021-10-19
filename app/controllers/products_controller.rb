class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews
  end
  
  # def average_rating
  #   @product = Product.find params[:id]
  #   num_reviews = @product.reviews.length
  #   total_rating = @product.reviews.reduce(0) { |sum, num| sum + num }

  #   total_rating/num_reviews
  # end

end
