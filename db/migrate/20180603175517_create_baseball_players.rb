class CreateBaseballPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :baseball_players do |t|
      t.text :first_name
      t.text :last_name
      t.text :position
      t.integer :age
    end
  end
end
