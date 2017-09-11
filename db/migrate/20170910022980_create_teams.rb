class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.decimal :rank, precision: 5, scale: 2
      t.timestamps
    end
  end
end
