class AddTeamWinningCountToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :winning_count, :integer
  end
end
