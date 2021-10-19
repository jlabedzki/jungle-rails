class Admin::DashboardController < Admin::BaseController
  def show
    @products = Product.all.size
    @categories = Category.all.size
  end
end
