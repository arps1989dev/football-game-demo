class Team < ApplicationRecord
	has_many :users_teams, dependent: :destroy
	has_many :users, through: :users_teams
	has_many :teams_matches, dependent: :destroy
	has_many :matches, through: :teams_matches

	validates :name, presence: true
	validate :has_users
	def has_users
		errors.add(:user_ids, 'at least select one user') if self.users.blank?
	end
end
