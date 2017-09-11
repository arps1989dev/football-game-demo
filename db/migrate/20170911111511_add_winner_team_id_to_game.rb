class AddWinnerTeamIdToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :winner_team_id, :integer
  end
end
