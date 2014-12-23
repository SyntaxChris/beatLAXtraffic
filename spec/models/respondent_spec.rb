require 'rails_helper'

describe Respondent do
  describe "Attributes" do
    let(:respondent) {
      FactoryGirl.build(
        :respondent,
        session_id: "d208970e98eb7d6be6dc899432549d99",
        flight_time_remaining: 30,
        time_elapsed: 15,
        current_node_id: 7,
        flight_code: "JFK",
        passenger_count: 2,
        luggage_count: 4,
        original_who_picking_up: "Boss",
        final_who_picking_up: "Friend",
        times_circled: 3,
        originating_location: "JFK",
        landing_time: 120,
        travel_companion: true,
        active: true
      )
    }

    it "has a session id" do
      expect(respondent.session_id).to eq "d208970e98eb7d6be6dc899432549d99"
    end

    it "has flight time remaining" do
      expect(respondent.flight_time_remaining).to eq 30
    end

    it "has time elapsed" do
      expect(respondent.time_elapsed).to eq 15
    end

    it "has a times circled" do
      expect(respondent.times_circled).to eq 3
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

    it "has an original pickup target party" do
      expect(respondent.original_who_picking_up).to eq "Boss"
    end

    it "has a final pickup target party" do
      expect(respondent.final_who_picking_up).to eq "Friend"
    end

    it "has an originating_location" do
      expect(respondent.originating_location).to eq "JFK"
    end

    it "has a landing_time" do
      expect(respondent.landing_time).to eq 120
    end

    it "has a travel_companion" do
      expect(respondent.travel_companion).to eq true
    end

    it "has an active boolean" do
      expect(respondent.active).to eq true
    end
  end

  describe "Associations" do
    let(:respondent) { FactoryGirl.build(:respondent) }

    it "has many responses" do
      expect(respondent).to have_many(:responses)
    end
  end

  describe "Features" do
    describe "get_or_create_by_session(session_id)" do
      describe "looks up a session to see if it has an active respondent session" do
        context "when session exists" do
        let!(:respondent) { FactoryGirl.create(:respondent, session_id: "1234") }
          it "returns that active session" do
            expect(Respondent.all.count).to eq 1
            expect(Respondent.get_or_create_by_session("1234")).to eq(
              {
                session_id: respondent.session_id,
                respondent_id: respondent.id
              }
            )
            expect(Respondent.all.count).to eq 1
          end
        end

        context "when session doesn't exist" do
          it "creates a session and returns it" do
            expect(Respondent.all.count).to eq 0
            expect(Respondent.get_or_create_by_session("1234")).to eq(
              {
                session_id: Respondent.last.session_id,
                respondent_id: Respondent.last.id
              }
            )
            expect(Respondent.all.count).to eq 1
          end
        end
      end
    end

    pending "increases its times_circled counter at appropriate times "\
            "(likely upon API call for recording a response and diong whatever "\
            "pre/post-work is needed for that.)"

  end
end
