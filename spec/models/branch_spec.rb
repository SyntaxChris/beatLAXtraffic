require 'rails_helper'

RSpec.describe Branch, :type => :model do
  describe "Attributes" do
  end

  describe "Associations" do
    let(:branch) { FactoryGirl.build(:branch) }

    it "has many nodes" do
      expect(branch).to have_many(:nodes)
    end
  end
end
