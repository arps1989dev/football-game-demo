class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
    	t.string :name
      t.integer :winner_team
      
      t.timestamps
    end
  end
end
