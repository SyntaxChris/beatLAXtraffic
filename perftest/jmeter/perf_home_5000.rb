require 'ruby-jmeter'

test do
	defaults domain: 'beatlaxtraffic.com'
	cache CLear_each_iteration: true
	cookies

	threads count: 5000, rampup: 30, duration: 180 do
		random_timer 5000, 10000

		transaction '01_demo_home' do
			visit '/'
		end
	end
end.flood('XRK8AE7soYvuLXk3x3cX', name: 'Demo', grid: 'pmmi24XaSMnKjGVEtutroQ')