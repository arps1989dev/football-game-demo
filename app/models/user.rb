class User < ApplicationRecord
	validates :first_name, :last_name, presence: true

	has_many :users_teams, dependent: :destroy
	has_many :teams, through: :users_teams

	def full_name
		"#{first_name} #{last_name}"
	end
end
