class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :description
      t.string :temperature
      t.string :brew_time
      t.string :caffeine_mgs

      t.timestamps
    end
  end
end
