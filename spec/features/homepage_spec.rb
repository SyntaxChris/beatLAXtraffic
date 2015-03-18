require 'rails_helper'

describe "Homepage", :js => true do

  it "starts" do
    skip "bring be back!"
  	visit "localhost:3000"
  	expect(page).to have_content('START')

  	page.find('.start-btn').click
  	expect(page).to have_content('LETS GO!')

  	page.find('#phone-next-btn').click
  	expect(page).to have_content('As you rush to the car, your phone displays...')

  	page.find('#stage-2-btn').click

    sleep 5 # sleep during driving animation

  	page.find('#stage-4-btn').click

  	fill_in 'zip-input', :with => '90001'
  	page.find('.zip-next').click

  	page.find('/assets/').click
  end

end
