require 'rails_helper'

RSpec.describe Response, :type => :model do
  describe "Attributes" do
    let(:response) { FactoryGirl.build(:response) }

    it "can have a freeform answer text" do
      answer = FactoryGirl.build(
        :answer,
        answer: "other"
      )
      response.answer = answer
      response.freeform_answer = "I have other reasons"

      expect(response.freeform_answer).to eq "I have other reasons"
      expect(response.answer.answer).to eq "other"
    end

    it "keeps track of 'times seen' for this session and this node, defaults to 1" do
      expect(response.times_seen).to eq 1
    end

    it "keeps track of 'time remaining', in minutes, for each decision point response" do
      response.time_remaining = 30
      expect(response.time_remaining).to eq 30
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

  describe "Features" do
    pending "checks to see if this user has responded to this node before, "\
             "if so, how many times, and increases times_seen accordingly"

    pending "if this response is a decision point, it logs the amount of time "\
            "remaining, in minutes, when this point is reached"

    pending "if there is no time left at a decision point, it logs '1' as the "\
            "amount of time remaining"
  end

end
