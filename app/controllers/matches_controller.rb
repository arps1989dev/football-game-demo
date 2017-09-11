class MatchesController < ApplicationController
	include InheritAction

	
	private
	def resource_params
		params.fetch(resource_name, {}).permit(:name, :game_id, team_ids:[])
	end
end