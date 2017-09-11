class GamesController < ApplicationController
	before_action :set_match
	before_action :set_game, only: [:edit, :update, :destroy]
	
	def index
		@resources = @match.games
	end

	def new
		@resource = @match.games.new
	end

	def edit
		@resource = @match.games.find(params[:id])
	end

	def create
		@resource = @match.games.new(resource_params)
		respond_to do |format|
			if @resource.save
				format.html { redirect_to match_games_path(@match), notice: 'Game was successfully created.'}
				format.json { render :index, status: :ok, location: @resource }
			else
				format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
	    if @resource.update_attributes(resource_params)
				format.html { redirect_to match_games_path(@match), notice: 'Game was successfully updated.' }
        format.json { render :index, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	
	def set_match
		@match = Match.find(params[:match_id])
		unless @match
			redirect_to matches_path, alert: 'Match not found.'
		end
	end

	def set_game
		@resource = @match.games.find(params[:id])
	end
	
	def resource_params
		params.fetch(:game, {}).permit(:name, :t1_score, :t2_score, :t1_id, :t2_id, :winner_team_id)
	end
end