require 'rails_helper'

RSpec.describe Question, :type => :model do
  describe "Attributes" do
    let(:question) {
      FactoryGirl.create(
        :question,
        question: "what year is it?"
      )
    }

    it "has a 'question' text content" do
      expect(question.question).to eq "what year is it?"
    end

  end

  describe "Associations" do
    let(:question) { FactoryGirl.create(:question) }

    it "belongs to a node" do
      expect(question).to belong_to(:node)
    end

    it "belongs to a question_type (ie 'multuple choice', 'select all applicable')" do
      expect(question).to belong_to(:question_type)
    end

    it "has many answers" do
      expect(question).to have_many(:answers)
    end
  end
end
