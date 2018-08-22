require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

     10.times do |n|
      @category.products.create!(
    name:  Faker::Hipster.sentence(3),
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel1.jpg'),
    quantity: 10,
    price: 64.99
    )
    end
  end

  scenario "they click on product to view details" do
    visit root_path

    first('article.product').click_link 'Details'

    save_screenshot 'product_details.png'
    expect(page).to have_css 'article.product-detail'

  end
end