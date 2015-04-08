require 'ruby-jmeter'

test do
	defaults domain: '/'
	cache CLear_each_iteration: true
	cookies

	threads count: 200, rampup: 30, duration: 180 do
		random_timer 5000, 10000

		transaction '01_demo_home' do
			visit '/'
		end
	end
end.grid 'XRK8AE7soYvuLXk3x3cX', {
  region: 'us-west-1',
  name: "Full #{NUM_THREADS}"
}