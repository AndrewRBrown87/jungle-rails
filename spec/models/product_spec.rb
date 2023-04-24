require 'rails_helper'
require 'category'
require 'product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'validates @product saves' do
      @category = Category.new({name: "toys"})

      @product = Product.new({name: "ball", price: "5", quantity: "1", category: @category})

      @product.save!

      expect(@product.id).to be_present

    end

    it 'validates :name, presence:true' do
      @category = Category.new({name: "toys"})
      
      @product = Product.new({name: nil, price: "5", quantity: "1", category: @category})

      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")

    end

    it 'validates :price, presence:true' do
      @category = Category.new({name: "toys"})
      
      @product = Product.new({name: "ball", price: "", quantity: "1", category: @category})

      @product.save

      expect(@product.errors.full_messages).to include("Price is not a number")

    end

    it 'validates :quantity, presence:true' do
      @category = Category.new({name: "toys"})
      
      @product = Product.new({name: "ball", price: "5", quantity: nil, category: @category})

      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end

    it 'validates :category, presence: true' do
      @category = Category.new({name: "toys"})
      
      @product = Product.new({name: "ball", price: "5", quantity: "1", category: nil})

      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")

    end
  end
end
