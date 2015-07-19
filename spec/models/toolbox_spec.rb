require 'rails_helper'

RSpec.describe Toolbox, :type => :model do
  it "Require fields" do
    toolbox = Toolbox.new
    expect(toolbox.errors_on(:name)).to_not be_empty
    expect(toolbox.errors_on(:location)).to_not be_empty
  end

  context "Model validations" do
    before(:each) do
      @toolbox = build(:toolbox)
    end

    it "doesn't throw exception" do
      expect { @toolbox.save! }.to_not raise_error
    end

    it "name can't be blank" do
      @toolbox.name = ""

      expect { @toolbox.save! }.to raise_error
      expect(@toolbox.errors_on(:name)).to_not be_empty
    end

    it "location can't be blank" do
      @toolbox.location = ""

      expect { @toolbox.save! }.to raise_error
      expect(@toolbox.errors_on(:location)).to_not be_empty
    end
  end
end
