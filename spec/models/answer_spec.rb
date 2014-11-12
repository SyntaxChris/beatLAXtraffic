require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe "Attributes" do
  end

  describe "Associations" do
    let(:answer) { FactoryGirl.build(:answer) }

    it "belongs to a question" do
      expect(answer).to belong_to(:question)
    end
  end
end
