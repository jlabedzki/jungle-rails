class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :reduce_quantity

  private
  
  def reduce_quantity
    self.line_items.each do |line_item|
      @product = Product.find_by(id: line_item.product.id)
      @product.update(quantity: @product.quantity - line_item.quantity)
    end
  end
end
