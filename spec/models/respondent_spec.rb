require 'rails_helper'

describe Respondent do
  describe "Attributes" do
    let(:respondent) {
      FactoryGirl.build(
        :respondent,
        session_id: 666,
        flight_time_remaining: 30,
        time_elapsed: 15,
        current_node_id: 7,
        flight_code: "JFK",
        passenger_count: 2,
        luggage_count: 4,
        who_picking_up: "Boss"
      )
    }

    it "has a session id" do
      expect(respondent.session_id).to eq 666
    end

    it "has flight time remaining" do
      expect(respondent.flight_time_remaining).to eq 30
    end

    it "has time elapsed" do
      expect(respondent.time_elapsed).to eq 15
    end

    it "has a current node location" do
      expect(respondent.current_node_id).to eq 7
    end

    it "has an originating flight airport code" do
      expect(respondent.flight_code).to eq "JFK"
    end

    it "has a number of passengers" do
      expect(respondent.passenger_count).to eq 2
    end

    it "has a number of luggage" do
      expect(respondent.luggage_count).to eq 4
    end

    it "has a pickup target party" do
      expect(respondent.who_picking_up).to eq "Boss"
    end
  end

  describe "Associations" do
    let(:respondent) { FactoryGirl.build(:respondent) }

    it "has many responses" do
      expect(respondent).to have_many(:responses)
    end
  end
end
