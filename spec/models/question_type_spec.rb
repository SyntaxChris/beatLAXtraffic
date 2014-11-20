require 'rails_helper'

RSpec.describe QuestionType, :type => :model do
  describe "Attributes" do
    let!(:question_type) {
      FactoryGirl.create(
        :question_type,
        name: 'multiple-choice'
      )
    }

    it "has a name" do
      expect(question_type.name).to eq "multiple-choice"
    end
  end

  describe "Associations" do
    let!(:question_type) { FactoryGirl.create(:question_type) }

    it "has many questions" do
      expect(question_type).to have_many(:questions)
    end
  end
end
