require 'rails_helper'

RSpec.describe Component, :type => :model do
  it "Throw errors on required fields" do
    component = Component.new
    expect(component.errors_on(:part_number)).to_not be_empty
    expect(component.errors_on(:stock)).to_not be_empty
    expect(component.errors_on(:description)).to_not be_empty
    expect(component.errors_on(:datasheet)).to_not be_empty
    expect(component.errors_on(:status)).to_not be_empty
  end

  context "Model validations" do
    before(:each) do
      @component = build(:component, status: { done: "nooop" })
    end

    it "doesn't trow exception" do
      expect { @component.save! }.to_not raise_error
    end

    it "Part number can't be blank" do
      @component.part_number = ""

      expect{ @component.save! }.to raise_error
      expect( @component.errors_on(:part_number) ).to_not be_empty
    end

    it "Part number can't be nil" do
      @component.part_number = nil

      expect{ @component.save! }.to raise_error
      expect( @component.errors_on(:part_number) ).to_not be_empty
    end

    it "Status can't be blank" do
      @component.status = {}

      expect{ @component.save! }.to raise_error
      expect( @component.errors_on(:status) ).to_not be_empty
    end

    it "Status can't be a String" do
      @component.status = ""

      expect{ @component.save! }.to raise_error
      expect( @component.errors_on(:status) ).to_not be_empty
    end

    it "Status can't be nil" do
      @component.status = nil

      expect{ @component.save! }.to raise_error
      expect( @component.errors_on(:status) ).to_not be_empty
    end

    it "have a normalized Part Number" do
      @component.save!

      expect(@component.part_number).to eql("ABCD123")
    end
  end

  context "Unique fields" do
    before(:all) do
      @component = create(:component, status: { done: "nooop" })
    end

    it "part number" do
      cm = build(:component, status: { testing: "yep" })

      expect{ cm.save! }.to raise_error(ActiveRecord::RecordNotUnique)
      expect( cm.errors_on(:part_number) ).to_not be_empty
    end
  end
end
