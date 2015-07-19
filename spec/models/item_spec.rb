require 'rails_helper'

RSpec.describe Item, :type => :model do
  it "Required fields" do
    item = Item.new
    expect(item.errors_on(:name)).to_not be_empty
    expect(item.errors_on(:quantity)).to_not be_empty
  end

  context "Model validations" do
    before(:each) do
      @item = build(:item)
    end

    it "doesn't throw exception" do
      expect { @item.save! }.to_not raise_error
    end

    it "name can't be blank" do
      @item.name = ""

      expect{ @item.save! }.to raise_error
      expect( @item.errors_on(:name) ).to_not be_empty
    end

    it "quantity can't be blank" do
      @item.quantity = nil

      expect{ @item.save! }.to raise_error
      expect( @item.errors_on(:quantity) ).to_not be_empty
    end

    it "quantity can't be less than zero" do
      @item.quantity = -1

      expect{ @item.save! }.to raise_error
      expect( @item.errors_on(:quantity) ).to_not be_empty
    end

    it "have a camelized name" do
      @item.save!

      expect( @item.name ).to eql("BananaPi")
    end

    describe "associations" do
      it "responds to toolboxes" do
        expect(@item).to respond_to :toolbox
      end

      it "responds to categories" do
        expect(@item).to respond_to :category
      end
    end
  end

  context "Unique" do
    before(:all) do
      @item = build(:item, name: "A Unique Name")
    end

    it "Name" do
      @item.save!

      im = build(:item, name: "A Unique Name")
      expect{ im.save! }.to raise_error
      expect( im.errors_on(:name) ).to_not be_empty
    end
  end
end
