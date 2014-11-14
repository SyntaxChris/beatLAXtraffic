require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe "Attributes" do
    let(:answer) {
      FactoryGirl.build(
        :answer,
        answer: "Yes, please"
      )
    }

    it "has an 'answer' text content" do
      expect(answer.answer).to eq "Yes, please"
    end
  end

  describe "Associations" do
    let(:answer) { FactoryGirl.build(:answer) }

    it "belongs to a question" do
      expect(answer).to belong_to(:question)
    end
  end
end
