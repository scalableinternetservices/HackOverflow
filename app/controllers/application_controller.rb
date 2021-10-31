class ApplicationController < ActionController::Base
	def hello
		render 'layouts/hello'
	end
end
