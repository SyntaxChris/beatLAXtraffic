require 'rails_helper'

RSpec.describe Response, :type => :model do
  describe "Attributes" do
    let(:response) { FactoryGirl.build(:response) }

    it "can have a freeform answer" do
      answer = FactoryGirl.build(
        :answer,
        answer: "other"
      )
      response.answer = answer
      response.freeform_answer = "I have other reasons"

      expect(response.freeform_answer).to eq "I have other reasons"
      expect(response.answer.answer).to eq "other"
    end
  end

  describe "Associations" do
    let(:response) { FactoryGirl.build(:response) }

    it "belongs to a respondent" do
      expect(response).to belong_to(:respondent)
    end

    it "belongs to a node" do
      expect(response).to belong_to(:node)
    end

    it "can belong to an answer" do
      puts "for below, should it -belong- to answer? how to represent the answer chosen?"
      expect(response).to belong_to(:answer)
    end

    it "can belong to a decision" do
      puts "for below, should it -belong- to decision? how to represent the decision chosen?"
      expect(response).to belong_to(:decision)
    end
  end
end
