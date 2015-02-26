require 'rails_helper'

describe Respondent do
  let(:starting_node) { FactoryGirl.create(:node, template_name: 'splash')}
  describe "Attributes" do
    let(:respondent) {
      FactoryGirl.build(
        :respondent,
        session_id: "d208970e98eb7d6be6dc899432549d99",
        flight_time_remaining: 30,
        time_elapsed: 15,
        current_node_id: 7,
        flight_code: "JFK",
        traffic_level: "slow",
        passenger_count: 2,
        luggage_count: 1,
        luggage_type: 'Large Suitcase',
        picking_up_number: 2,
        original_who_picking_up: "Boss",
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

    it "has a traffic level" do
      expect(respondent.traffic_level).to eq "slow"
    end

    it "has an originating flight airport code" do
      expect(respondent.flight_code).to eq "JFK"
    end

    it "has a number of passengers" do
      expect(respondent.passenger_count).to eq 2
    end

    it "has a number of luggage" do
      expect(respondent.luggage_count).to eq 1
    end

    it "has a type of luggage" do
      expect(respondent.luggage_type).to eq "Large Suitcase"
    end

    it "has a pickup target number" do
      expect(respondent.picking_up_number).to eq 2
    end

    it "has an original pickup target party" do
      expect(respondent.original_who_picking_up).to eq "Boss"
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

    it "has many seen nodes" do
      expect(respondent).to have_many(:seen_nodes)
    end
  end

  describe "Features" do
    let!(:starting_node) { FactoryGirl.create(:node, template_name: 'splash', next_node_id: 100) }
    context "on create hooks" do
      # not doing the below. see comment in Respondent#set_starting_node
      # before :each do
      #   starting_node = FactoryGirl.create(:node, template_name: 'sq-2-2')
      #   allow_any_instance_of(Respondent)
      #     .to receive(:set_starting_node).and_return(starting_node.id)
      # end
      let!(:new_respondent) { FactoryGirl.create(:respondent) }

      it "on creation, current_node_id equals the starting node" do
        expect(new_respondent.current_node_id).to eq Node.find_by_template_name("splash").id
      end

      it "on creation, 'flight_code' is set" do
        expect(new_respondent.flight_code).to be_between(Respondent::FLIGHT_NUMBERS.min, Respondent::FLIGHT_NUMBERS.max)
      end

      it "on creation, 'luggage_count' is set" do
        expect(new_respondent.luggage_count).to be_between(1,3)
      end

      it "on creation, 'traffic_level' is set" do
        expect(Respondent::TRAFFIC_LEVELS).to include(new_respondent.traffic_level)
      end

      it "on creation, 'luggage_type' is set" do
        expect(Respondent::LUGGAGE_TYPES).to include(new_respondent.luggage_type)
      end

      it "on creation, 'originating_location' is set" do
        expect(Respondent::ORIGINATING_LOCATIONS.collect{|hash| hash[:city]}).to include(new_respondent.originating_location)
      end

      it "on creation, 'originating_airport_code' is set" do
        expect(Respondent::ORIGINATING_LOCATIONS.collect{|hash| hash[:code]}).to include(new_respondent.originating_airport_code)
      end

      it "on creation, 'picking_up_number' is set" do
        expect(new_respondent.picking_up_number).to be_between(1,3)
      end

      it "on creation, 'original_who_picking_up' is set" do
        expect(Respondent::PICKUP_TARGETS).to include(new_respondent.original_who_picking_up)
      end

      it "on creation, 'travel_companion' is set" do
        expect([true, false]).to include(new_respondent.travel_companion)
      end

      it "on creation, 'landing_time' is set" do
        expect(Respondent::TIME_TILL_LANDS).to include(new_respondent.landing_time)
      end
    end

    describe "get_or_create_by_session(session_id)" do
    let!(:starting_node) { FactoryGirl.create(:node, template_name: 'splash') }
      describe "looks up a session to see if it has an active respondent session" do
        context "when session exists" do
        let!(:respondent) { FactoryGirl.create(:respondent, session_id: "1234") }
          it "returns that active session" do
            node_1 = create(:node)
            seen_node = respondent.seen_nodes.create(node_id: node_1.id)

            expect(Respondent.all.count).to eq 1
            expect(Respondent.get_or_create_by_session("1234")[:respondent]).to eq respondent
            expect(Respondent.all.count).to eq 1
          end
        end

        context "when session doesn't exist" do
          it "creates a session and returns it" do
            expect(Respondent.all.count).to eq 0
            expect(Respondent.get_or_create_by_session("1234")[:respondent]).to eq Respondent.last
            expect(Respondent.all.count).to eq 1
          end
        end
      end

      describe "evenly_distributed_pickup_target" do
        let!(:f1) { FactoryGirl.create(:respondent) }
        let!(:f2) { FactoryGirl.create(:respondent) }

        context "when there is one least-used" do
          it "returns the pickup target with the lowest occurance" do
            f1.update(original_who_picking_up: "Friend")
            f2.update(original_who_picking_up: "Coworker")
            expect(Respondent.evenly_distributed_pickup_target).to eq "Parent"
          end
        end
        context "when there are two or more least-used" do
          it "returns a random selection of the lowest occurances" do
            f1.update(original_who_picking_up: "Friend")
            f2.update(original_who_picking_up: "Friend")
            expect(["Coworker", "Parent"]).to include(Respondent.evenly_distributed_pickup_target)
          end
          it "returns a random selection of the lowest occurances" do
            expect(["Coworker", "Parent", "Friend"]).to include(Respondent.evenly_distributed_pickup_target)
          end
        end
      end

      describe "update_node_history" do
        let!(:respondent) { create(:respondent) }
        let!(:answer) { create(:answer) }
        context "when next node hasn't been seen" do
          let!(:first_dp) { create(:node, is_decision_point: true) }
          let!(:further_node) { create(:node, next_node_id: first_dp.id) }
          let!(:next_node) { create(:node, next_node_id: further_node.id) }
          let!(:current_node) { create(:node, next_node_id: next_node.id) }

          it "advances to the next node" do
            # don't create seen nodes
            #
            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              node_id: current_node.id,
              next_node_id: next_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }

            respondent.update_node_history(argument_params)
            expect(respondent.current_node_id).to eq next_node.id
          end
        end

        context "when next node has been seen" do
          let!(:first_dp) { create(:node, is_decision_point: true) }
          let!(:further_node) { create(:node, next_node_id: first_dp.id) }
          let!(:seen_node) { create(:node, next_node_id: further_node.id) }
          let!(:current_node) { create(:node, next_node_id: seen_node.id) }

          it "advances to the next decision point" do
            # create seen nodes
            [seen_node, further_node, first_dp].each do |node|
              respondent.seen_nodes.create(node_id: node.id)
            end
            respondent.update(current_node_id: current_node.id)

            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              node_id: current_node.id,
              next_node_id: seen_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }

            respondent.update_node_history(argument_params)
            expect(respondent.current_node_id).to eq first_dp.id
          end

          it "advances to the next decision point if already on a decision point!" do
            alternate_start = create(:node, next_node_id: seen_node.id, is_decision_point: true)
            # create seen nodes
            [seen_node, further_node, first_dp].each do |node|
              respondent.seen_nodes.create(node_id: node.id)
            end
            respondent.update(current_node_id: alternate_start.id)

            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              node_id: alternate_start.id,
              next_node_id: seen_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }

            respondent.update_node_history(argument_params)
            expect(respondent.current_node_id).to eq first_dp.id
          end

          it "advances to the next unseen node" do
            # create seen nodes
            [seen_node, first_dp].each do |node|
              respondent.seen_nodes.create(node_id: node.id)
            end
            respondent.update(current_node_id: current_node.id)

            argument_params = {
              is_decision: false,
              respondent_id: respondent.id,
              node_id: current_node.id,
              next_node_id: seen_node.id,
              answers: [
                { id: answer.id,
                  rank: nil
              }
              ],
                time_elapsed: 10
            }

            respondent.update_node_history(argument_params)
            expect(respondent.current_node_id).to eq further_node.id
          end
        end

      end
    end

    pending "increases its times_circled counter at appropriate times "\
            "(likely upon API call for recording a response and diong whatever "\
            "pre/post-work is needed for that.)"

  end
end
