class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token # Trying to get rid of 422 errors
end
