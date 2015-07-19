require 'rails_helper'

RSpec.describe Component, :type => :model do
  it "Throw errors on required fields" do
    component = Component.new
    expect(component.errors_on(:name)).to_not be_empty
    expect(component.errors_on(:description)).to_not be_empty
    expect(component.errors_on(:model)).to_not be_empty
    expect(component.errors_on(:datasheet)).to_not be_empty
    expect(component.errors_on(:status)).to_not be_empty
  end

  context "Model validations" do
    before(:all) do
      @component = build(:component, status: { done: "nooop" })
    end

    it "doesn't trow exception with valid data" do
      expect { @component.save! }.to_not raise_error
    end

    it "Name can't be blank" do
      @component.name = ""

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:name) ).to_not be_empty
    end

    it "Name can't be nil" do
      @component.name = nil

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:name) ).to_not be_empty
    end

    it "Description can't be blank" do
      @component.description = ""

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:description) ).to_not be_empty
    end

    it "Stock can't be nil" do
      @component.stock = nil

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:stock) ).to_not be_empty
    end

    it "Stock can't be negative" do
      @component.stock = -1

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:stock) ).to_not be_empty
    end

    it "Status can't be blank" do
      @component.status = {}

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:status) ).to_not be_empty
    end

    it "Status can't be a String" do
      @component.status = ""

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:status) ).to_not be_empty
    end

    it "Status can't be nil" do
      @component.status = nil

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:status) ).to_not be_empty
    end

    it "Datasheet can't be blank" do
      @component.datasheet = ""

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:datasheet) ).to_not be_empty
    end

    it "model can't be blank" do
      @component.model = ""

      expect{ @component.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect( @component.errors_on(:model) ).to_not be_empty
    end

    describe "associations" do
      it "responds to toolboxes" do
        expect(@component).to respond_to :toolbox
      end

      it "responds to categories" do
        expect(@component).to respond_to :category
      end
    end
  end
end
