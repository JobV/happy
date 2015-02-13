class DashboardController < ApplicationController
	def index
		@people = Person.all
	end
end
