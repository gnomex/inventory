require 'rails_helper'

RSpec.feature "Components features", type: :feature, js: true do
  background(:all) do
    FactoryGirl.create(:category)
  end
  # given!(:category)  { FactoryGirl.create(:category) }

  scenario 'create with valid data' do
    visit new_component_path

    component_name = Faker::Commerce.product_name

    within("#new_component") do
      fill_in 'component_name', with: component_name
      fill_in 'component_model', with: Faker::Lorem.word
      fill_in 'component_stock', with: Faker::Number.between(0, 100)
      fill_in 'component_description', with: Faker::Lorem.sentence
      fill_in 'component_manufacturer', with: Faker::Company.name
      fill_in 'component_datasheet', with: Faker::Internet.url
      fill_in 'component_image_link', with: Faker::Avatar.image
      find('#component_category_id').click
    end

    click_on "Save!"

    expect(page.current_path).to eql(components_path)
    expect(page).to have_content "The #{component_name} has been created"
  end

  # scenario "don't create and raise errors with invalid data" do
  # end

  # scenario 'assign a category' do
  #   # find('#component_category_id').click
  # end

  # scenario 'remove' do
  # end
end
