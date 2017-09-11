class TeamsController < ApplicationController
	include InheritAction
	def index
		@resources = Team.order("rank DESC","winning_count DESC")	
	end

	private
	def resource_params
		params.fetch(resource_name, {}).permit(:name, user_ids:[])
	end
end