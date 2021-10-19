class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    self.quantity === 0
  end

  def has_reviews?
    self.reviews.length > 0
  end

  def average_rating
    num_reviews = self.reviews.length
    ratings = []
    self.reviews.each { |review| ratings.push(review[:rating])}
    total_rating = ratings.reduce(0) { |sum, num| sum + num }

    (total_rating.to_f/num_reviews).round(1)
  end

end
