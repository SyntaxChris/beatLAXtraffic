require 'rails_helper'

describe Respondent do
  describe "Attributes" do
  end

  describe "Associations" do
    let(:respondent) { FactoryGirl.build(:respondent) }

    it "has many responses" do
      expect(respondent).to have_many(:responses)
    end
  end
end
