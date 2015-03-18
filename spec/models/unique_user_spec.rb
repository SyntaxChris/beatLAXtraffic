require 'rails_helper'

describe UniqueUser do
  let(:unique_user) {
    FactoryGirl.create(
      :unique_user,
      browser_identifier: "123abc"
    )
  }

  describe "Attributes" do
    it "has a browser_identifier" do
      expect(unique_user.browser_identifier).to eq "123abc"
    end
  end

  describe "Associations" do
    it "has many respondents" do
      expect(unique_user).to have_many(:respondents)
    end
  end

  describe "Features" do
    describe "get_or_create" do
      context "when user with this browser_identifier exists" do
        let!(:user) {
          FactoryGirl.create(:unique_user, browser_identifier: "uniqueperson")
        }

        it "finds the user and returns the id" do
          prior_count = UniqueUser.count
          expect(
            UniqueUser.get_or_create_by_identifier(user.browser_identifier)[:user_id]
          ).to eq user.id
          expect(UniqueUser.count).to eq prior_count
        end

        it "finds the user and returns the gameplay number for the next session" do
          prior_count = UniqueUser.count
          expect(
            UniqueUser.get_or_create_by_identifier(user.browser_identifier)[:gameplay_number]
          ).to eq 1
          expect(UniqueUser.count).to eq prior_count
        end

      end

      context "when user with this browser_identifier doesn't exist" do

        it "creates the user and returns the id" do
          prior_count = UniqueUser.count
          expect(
            UniqueUser.get_or_create_by_identifier("abc23")[:user_id]
          ).not_to be_nil
          expect(UniqueUser.count).to eq prior_count + 1
        end

        it "finds the user and returns the gameplay number for the next session" do
          prior_count = UniqueUser.count
          expect(
            UniqueUser.get_or_create_by_identifier("abc23")[:gameplay_number]
          ).to eq 1
          expect(UniqueUser.count).to eq prior_count + 1
        end

      end

    end
  end
end
