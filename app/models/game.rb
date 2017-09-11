class Game < ApplicationRecord
	# Relationship with models
	belongs_to :match

	# validation for necessary filed
	validates :t1_score, :t2_score, :t1_id, :t2_id, presence: true

	# callback which apply on specific action of object
	before_validation :game_winner
	after_save :match_winner

	def game_winner
		if self.t1_score.to_i == 10 || self.t2_score.to_i == 10
			if self.t1_score.to_i > self.t2_score.to_i
				self.winner_team_id = t1_id
			else
				self.winner_team_id = t2_id
			end
		end
	end

	def match_winner
		team = self.match.games.pluck(:winner_team_id)
		winner_team = team.detect{ |e| team.count(e) > 1 }
		if winner_team
			self.match.update_attributes(winner_team: winner_team)
		end
	end

end
