require 'rails_helper'

describe "Homepage", :js => true do

  before(:each) do
  	visit "http://localhost:3000"
    #visit "http://www.beatlaxtraffic.com"
  	expect(page).to have_content('START')

  	page.find('.start-btn').click
    sleep 2 # Animation delay
  	expect(page).to have_content('LETS GO!')

  	page.find('#phone-next-btn').click
  	expect(page).to have_content('As you rush to the car, your phone displays...')

  	page.find('#stage-2-btn').click

    sleep 5 # sleep during driving animation

  	page.find('#stage-4-btn').click

  	fill_in 'zip-input', :with => '90001'
  	page.find('.zip-next').click

    sleep 2
  end

  	#page.find('green').click
  it "picks parking lot" do
    # None of the options to pick a path look like they have
    # a unique piece of css to page.find so change the bracketted
    # number to make a selection [0-3]
    # 0 = Parking lot
    # 1 = Pick up at Curb
    # 2 = Off site
    # 3 = Tram
    page.all('.x-btn-select-path.select-path-btn')[0].click

    # GO! DOES NOT DO ANTHING WHEN CLICKED IN CHROME 
    # EVEN WHEN CLICKED MANUALY
    click_button 'GO!'

    sleep 1 # animation delay
    
    $i = 0
    while $i < 4 do
      page.all('.parking-bbl')[$i].click
      $i += 1
    end
    # sleep 1
    # page.all('.bbl-icon')[0].click
    

    fill_in 'park-bbl', :with => "Totally tubular tenacious test text that's tight"
    page.find('.ok-btn').click
    sleep 3
    page.find('.park-btn-next.plane-advance').click

    sleep 1
    page.find('#text-1').click
    page.find('#timer-question').click

    sleep 10
    page.find('#phone-background').click
    page.find('#hang-out-background').click
    page.find('#shop-background').click
    page.find('#eat-background').click

    page.find('.tile-next.plane-advance').click

    # Don't try it, the wheel has the high ground (parking is full)
    page.find('#parking').click
    sleep 5

    page.find('#spin-parking-lose').click
    sleep 5

    # 1 = Try to pick up at curb
    page.find('.inner-content.indigo').click

    page.find('.thought-button.left-button').click
    page.find('.think-next-btn.plane-advance').click
    sleep 5
    
    page.find('.select-btn.check-phone').click
    page.find('#x-btn-late-flight-next.late-flight-next-btn.plane-advance').click

    page.find('#pickup.spin-button').click
    sleep 5
    
    page.find('#spin-pickup-lose.next.spinner-continue-btn,plane-advance').click

    ##### BACK AT GPS MENU #####
    sleep 5
    page.all('.x-btn-select-path.select-path-btn')[1].click
    click_button 'GO!'

    page.find('#pickup.spin-button').click 
    sleep 5

    page.find('#spin-pickup-lose.next.spinner-continue-btn.plane-advance').click

    ##### BACK AT GPS MENU #####

    sleep 2
    page.all('.x-btn-select-path.select-path-btn')[2].click
    click_button 'GO!'

    page.find('.inner-content.blue').click

    page.find('#text-1.large-6.medium-6.small-6.columns.txt').click
    page.find('#timer-question.next.plane-advance').click

    page.find('#pickup.spin-button').click
    sleep 5
    page.find('#spin-pickup-lose.next.spinner-continue-btn.plane-advance').click

    page.find('.inner-content.magenta').click

    page.find('.icon-holder.answer-5').click
    page.find('.yea.ng-scope').click
    page.find('.icon-holder.answer-4').click
    page.find('.yea.ng-scope').click
    page.find('.icon-holder.answer-6').click
    page.find('.yea.ng-scope').click
    page.find('.next-btn.car-progress.show').click

    sleep 20

  end

end

# Noteable errors with beatlaxtraffic.com

# 1. After select method of picking up passenger clicking "GO!" does nothing in the Chrom browser

# 2. After selecting the "Parking lot" option then following menus have graphical errors: Images shifted, buttons covered by other graphcis (next button is unclickable  when the window is not maximized), text box shifted

# 3. On the "What are you doing while you're parked?" page consider moving or changing the animation of the plane fly by, it disables user input onto what ever it is over and covers a large area for a noticable amount of time.