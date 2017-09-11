class Match < ApplicationRecord
	# Relationship with models
	has_many :games
	has_many :teams_matches, dependent: :destroy
	has_many :teams, through: :teams_matches

	# validation for necessary delete_field
  validate :has_teams
  after_save :calculate_team_rank
	
	def has_teams
		errors.add(:team_ids, 'select two team') if self.team_ids.count != 2
	end

	def calculate_team_rank
		self.teams.each do |team|
			winning_count = team.matches.where(winner_team: team.id).count
			winning_ratio = (winning_count * 100 / team.matches.count.to_f)
			team.update(rank: winning_ratio, winning_count: winning_count)
		end
	end
end
