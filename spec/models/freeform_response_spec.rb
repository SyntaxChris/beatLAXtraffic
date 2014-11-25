require 'rails_helper'

RSpec.describe FreeformResponse, :type => :model do
  describe "Attributes" do

  end

  describe "Associations" do
    let(:freeform_response) { FactoryGirl.create(:freeform_response) }
    it "belongs to a response" do
      expect(freeform_response).to belong_to(:response)
    end
  end
end

