require 'rails_helper'

RSpec.feature "Items features", type: :feature, js: true do
  background(:all) do
    FactoryGirl.create(:category)
    FactoryGirl.create(:toolbox)
  end

  scenario 'create with valid data' do
    visit new_item_path

    item_name = Faker::Hacker.abbreviation

    within("#new_item") do
      fill_in 'item_name', with: item_name
      fill_in 'item_quantity', with: Faker::Number.between(0, 100)
      fill_in 'item_useful_for', with: Faker::Hacker.say_something_smart
      find('#item_category_id').click
      find('#item_toolbox_id').click
    end

    click_on "Save!"

    expect(page.current_path).to eql(items_path)
    expect(page).to have_content "The item #{item_name.camelize} has been created!"

  end

  # scenario "don't create and raise errors with invalid data" do
  # end

  # scenario 'assign a category' do
  #   # find('#component_category_id').click
  # end

  # scenario 'remove' do
  # end
end
