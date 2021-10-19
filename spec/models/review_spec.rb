require 'rails_helper'

RSpec.describe Review, type: :model do
  it "successfully saves a review when all necessary input fields are filled" do
    @review_count = Review.all.count

    @review = Review.create!(
      product_id: 1,
      user_id: 1,
      description: "Good shirt",
      rating: 4
    )

    expect(Review.all.count).to eq(@review_count + 1)
  end
end
