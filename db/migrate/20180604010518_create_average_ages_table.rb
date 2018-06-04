class CreateAverageAgesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :average_ages do |t|
      t.text :sport
      t.text :position
      t.float :age
    end
  end
end
