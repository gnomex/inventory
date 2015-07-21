require 'rails_helper'

RSpec.feature "Categories features", type: :feature, js: true do
  # background(:all) do
  # end

  scenario 'create with valid data' do
    visit '/categories/new'

    category_name = Faker::Commerce.department

    within("#new_category") do
      fill_in 'category_name', with: category_name
    end

    click_on "Save!"

    expect(page.current_path).to eql(categories_path)
    expect(page).to have_content "The category #{category_name.humanize} is safe now!"
  end

  # scenario "don't create and raise errors with invalid data" do
  # end

  # scenario 'assign a category' do
  #   # find('#component_category_id').click
  # end

  # scenario 'remove' do
  # end
end
