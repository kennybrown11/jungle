require 'rails_helper'

 RSpec.describe Product, type: :model do
  before :each do
    @category = Category.create name: "name"
    @badCategory = Category.create
    @product = Product.create name: "name", quantity: 1, price: 89, category: @category
    @badProduct = Product.create
    @textPriceProduct = Product.create price: 'price'
  end

   it "check if name responds" do
    should respond_to(:name)
  end

   it "is not valid without a name" do
    expect(@product).to be_valid
    expect(@badProduct.errors.messages[:name]).to include("can't be blank")
  end

   it "requires name" do
    p = Product.new
    p.valid?
    expect(p.errors.messages[:name]).to include("can't be blank")
    p.name = 'has name'
    p.valid?
    expect(p.errors.messages[:name]).to be_nil
  end

   it "is not valid wihout a price, price a number" do
    expect(@product).to be_valid
    expect(@badProduct.errors.messages[:price]).to include("can't be blank")
    expect(@textPriceProduct.errors.messages[:price]).to include("is not a number")
  end
   it "is not valid without a quantity" do
    expect(@product).to be_valid
    expect(@badProduct.errors.messages[:quantity]).to include("can't be blank")
  end
  
  it "is not valid without a category" do
    @badP = Product.create name: "name", quantity: 1, price: 89, category: nil
    expect(@product).to be_valid
    expect(@badP.errors.messages[:category]).to include("can't be blank")
  end

end