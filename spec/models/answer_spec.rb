require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe "Attributes" do
    let(:answer) {
      FactoryGirl.build(
        :answer,
        answer: "Yes, please",
        icon_name: "on-phone",
        custom_order: 2
      )
    }

    it "has an 'answer' text content" do
      expect(answer.answer).to eq "Yes, please"
    end

    it "has an icon_name" do
      expect(answer.icon_name).to eq "on-phone"
    end

    it "has a custom_order" do
      expect(answer.custom_order).to eq 2
    end
  end

  describe "Associations" do
    let(:answer) { FactoryGirl.build(:answer) }

    it "belongs to a question" do
      expect(answer).to belong_to(:question)
    end
  end
end
