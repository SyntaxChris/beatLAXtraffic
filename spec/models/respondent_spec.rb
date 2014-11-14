require 'rails_helper'

describe Respondent do
  describe "Attributes" do
    let(:respondent) {
      FactoryGirl.build(
        :respondent,
        unique_identifier: 666
      )
    }

    it "has a unique id" do
      expect(respondent.unique_identifier).to eq 666
    end
  end

  describe "Associations" do
    let(:respondent) { FactoryGirl.build(:respondent) }

    it "has many responses" do
      expect(respondent).to have_many(:responses)
    end
  end
end
