class TestController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:index]
	
	def index

		# Count the number of files in each test.
		@sizes = Array.new
		Dir.glob('./tests/*').each do |d|
			@sizes << Dir.glob(d + "/*").count
		end
		
		@tests =  Dir.glob('./tests/*')
		@tests.map! { |e| e.split("/").last + "/" }
		
		@test = Dir.glob('./tests/*').first + "/"
	end

end
