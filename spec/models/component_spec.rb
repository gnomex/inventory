require 'rails_helper'

RSpec.describe Component, :type => :model do
  context "Required fields" do
    it "don't create with blank or invalid data" do
      component = Component.new
      expect(component.errors_on(:part_number)).to_not be_empty
      expect(component.errors_on(:stock)).to_not be_empty
      expect(component.errors_on(:description)).to_not be_empty
      expect(component.errors_on(:datasheet)).to_not be_empty
      expect(component.errors_on(:status)).to_not be_empty
    end
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
      expect(@component).to_not be_valid
    end

    it "have a normalized Part Number" do
      @component.save!

      expect(@component.part_number).to eql("ABCD123")
    end
  end

  context "Unique" do
    before(:all) do
      @component = build(:component, status: { testing: "yep" })
    end

    it "Part number" do
      @component.save!

      cm = build(:component, status: { testing: "yep" })
      cm.save!
    end
  end
end

