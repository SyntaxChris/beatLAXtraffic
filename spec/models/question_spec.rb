require 'rails_helper'

RSpec.describe Question, :type => :model do
  describe "Attributes" do
  end

  describe "Associations" do
    let(:question) { FactoryGirl.create(:question) }

    it "belongs to a node" do
      expect(question).to belong_to(:node)
    end

    it "has many answers" do
      expect(question).to have_many(:answers)
    end
  end
end
