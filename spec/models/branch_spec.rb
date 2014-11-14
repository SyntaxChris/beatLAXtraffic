require 'rails_helper'

RSpec.describe Branch, :type => :model do
  describe "Attributes" do
    let(:branch) {
      FactoryGirl.build(
        :branch,
        name: "initial-branch"
      )
    }

    it "has a name" do
      expect(branch.name).to eq "initial-branch"
    end
  end

  describe "Associations" do
    let(:branch) { FactoryGirl.build(:branch) }

    it "has many nodes" do
      expect(branch).to have_many(:nodes)
    end
  end
end
