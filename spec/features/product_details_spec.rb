require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

  end

  scenario "They click on the first product's 'Details' button" do
    # ACT
    visit root_path

    first('article.product').click_link 'Details'

    # DEBUG / VERIFY
    save_screenshot

    
    expect(page).to have_css 'article.product-detail', count: 1
    expect(page).to have_css 'article', count: 1
  end

end
