require 'rails_helper'

RSpec.feature "Toolboxes features", type: :feature, js: true do
  scenario 'create with valid data' do
    visit '/toolboxes/new'

    name = Faker::App.name

    within("#new_toolbox") do
      fill_in 'toolbox_name', with: name
      fill_in 'toolbox_owner', with: Faker::Name.name
      fill_in 'toolbox_location', with: [Faker::Name.prefix, Faker::Name.last_name, "cabinet"].join(' ')
      fill_in 'toolbox_description', with: Faker::Hacker.say_something_smart
    end

    click_on "Save!"

    expect(page.current_path).to eql(toolboxes_path)
    expect(page).to have_content "The sandbox #{name.camelize} has been created!"
  end

  # scenario "don't create and raise errors with invalid data" do
  # end

  # scenario 'assign a category' do
  #   # find('#component_category_id').click
  # end

  # scenario 'remove' do
  # end
end
