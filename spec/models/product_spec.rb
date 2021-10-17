require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product successfully when all 4 fields are set' do

      @product_count = Product.all.count

      @category = Category.new(name: 'Clothing')

      @product = Product.new(
        name: "Trainers",
        price_cents: 5000,
        quantity: 4,
        category: @category
      )

      @product.save!

      expect(Product.all.count).to eq(@product_count + 1)
    end

    it 'should give an error if no name is given' do

      @category = Category.new(name: 'Clothing')

      @product = Product.new(
        name: nil,
        price_cents: 5000,
        quantity: 4,
        category: @category
      )

      @product.validate

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'should give an error if no price is given' do

      @category = Category.new(name: 'Clothing')

      @product = Product.new(
        name: "Trainers",
        price_cents: nil,
        quantity: 4,
        category: @category
      )

      @product.validate
        
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should give an error if no quantity is given' do

      @category = Category.new(name: 'Clothing')

      @product = Product.new(
        name: "Trainers",
        price_cents: 5000,
        quantity: nil,
        category: @category
      )

      @product.validate

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should give an error if no category is given' do

      @product = Product.new(
        name: "Trainers",
        price: 5000,
        quantity: 4,
        category: nil
      )

      @product.validate

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
