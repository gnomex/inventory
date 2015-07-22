require 'rails_helper'

RSpec.feature "Components features", type: :feature, js: true do
  background(:all) do
    @category ||= FactoryGirl.create(:category)
    @box ||= FactoryGirl.create(:toolbox)
  end

  scenario 'create with valid data' do
    visit "/components/new"

    component_name = Faker::Commerce.product_name

    within("#new_component") do
      fill_in 'component_name', with: component_name
      fill_in 'component_model', with: Faker::Lorem.word
      fill_in 'component_stock', with: Faker::Number.between(0, 100)
      fill_in 'component_description', with: Faker::Lorem.sentence
      fill_in 'component_manufacturer', with: Faker::Company.name
      fill_in 'component_datasheet', with: Faker::Internet.url
      fill_in 'component_image_link', with: Faker::Avatar.image
      find('#component_category_id').find("option[value=#{@category.id}]").select_option
      find('#component_toolbox_id').find("option[value=#{@box.id}]").select_option
    end

    # expect {
    click_on "Save!"
    # }.to change(Component.all.count).from(0).to(1)

    expect(page.current_path).to eql(components_path)
    expect(page).to have_selector('#flash_messages section.notice')
    expect(page).to have_content "The #{component_name} has been created"
  end

  # scenario "don't create and raise errors with invalid data" do
  #   visit "/components/new"

  #   click_on "Save!"

  #   expect(all(:css, '.field_with_errors').count).to eq(4)
  #   expect(page.current_path).to eql(new_component_path)
  # end

  # scenario 'assign a category' do
  #   # find('#component_category_id').click
  # end

  # scenario 'remove' do
  # end
end
