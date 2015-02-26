require "rails_helper"

describe SeenNode do
  describe "Associations" do
    let!(:seen_node) { create(:seen_node) }
    it "belongs to a respondent" do
      expect(seen_node).to belong_to(:respondent)
    end
    it "belongs to a node" do
      expect(seen_node).to belong_to(:node)
    end
  end
end
