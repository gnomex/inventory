require 'rails_helper'

RSpec.describe Component, :type => :model do
  context "Required fields" do
    it "don't create with invalid data" do
      component = Component.new
      expect(component.errors_on(:part_number)).to_not be_empty
      expect(component.errors_on(:stock)).to_not be_empty
      expect(component.errors_on(:description)).to_not be_empty
      expect(component.errors_on(:datasheet)).to_not be_empty
      expect(component.errors_on(:status)).to_not be_empty
    end
  end

  context "Model rules" do
    it "doesn't trow exception" do
      # expect {
      #   Component.create!({
      #     part_number: "abcd12345",
      #     stock: 1,
      #     description: "A example of component",
      #     datasheet: "www.alldatasheets.com/abcd12345",
      #     status: {in_use: "noop"}
      # })}.to_not raise_error
      component = build(:component, status: { done: "nooop" })
      expect { component.save! }.to_not raise_error
    end

    it "have a normalized Part Number" do
      component = build(:component, status: { done: "yeap" })
      component.save!

      expect(component.part_number).to eql("ABCD123")
    end
  end

  context "Unique data" do
    before(:all) do
      @component = build(:component, status: { testing: "yep" })
    end

    it "part number" do
      @component.save!

      cm = build(:component, status: { testing: "yep" })
      cm.save!

      expect(cm.errors_on(:part_number)).to_not be_empty
    end
  end
end

