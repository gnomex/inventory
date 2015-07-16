require 'rails_helper'

RSpec.describe Category, :type => :model do
  it "Required filed" do
    category = Category.new
    expect(category.errors_on(:name)).to_not be_empty
  end

  context "Model validations" do
    before(:each) do
      @category = build(:category)
    end

    it "doesn't trow exception" do
      expect { @category.save! }.to_not raise_error
    end

    it "Name can't be blank" do
      @category.name = ""
      expect(@category).to_not be_valid
    end

    it "have a normalized name" do
      @category.save!

      expect(@category.name).to eql("A big marmota")
    end
  end
end
