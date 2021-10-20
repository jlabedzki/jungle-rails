require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'After creation' do

    before :each do
      @category = Category.create!(name: 'Clothing')

      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(
        name: "Trainers",
        price_cents: 5000,
        quantity: 4,
        category: @category
      )

      @product2 = Product.create!(
        name: "Shorts",
        price_cents: 5000,
        quantity: 7,
        category: @category
      )

      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(
        name: "Shirt",
        price_cents: 5000,
        quantity: 2,
        category: @category
      )
    end


    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below

      @order = Order.new(
        total_cents: 500000,
        stripe_charge_id: "random",
        email: "fake@fake.com"
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price,
        total_price: @product1.price
      )

      @order.line_items.new(
        product: @product2,
        quantity: 1,
        item_price: @product2.price,
        total_price: @product2.price
      )
        
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(3)
      expect(@product2.quantity).to eq(6)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(
        total_cents: 500000,
        stripe_charge_id: "random",
        email: "fake@fake.com"
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price,
        total_price: @product1.price
      )

      @order.line_items.new(
        product: @product2,
        quantity: 1,
        item_price: @product2.price,
        total_price: @product2.price
      )
        
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!

      expect(@product3.quantity).to eq(2)
    end
  end
end
