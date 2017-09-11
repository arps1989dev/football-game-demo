class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
	    t.string "name"
	    t.integer "match_id"
	    t.integer "t1_id"
	    t.integer "t2_id"
      t.integer "t1_score", default: 0
	    t.integer "t2_score", default: 0

      t.timestamps
    end
  end
end
