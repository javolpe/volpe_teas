class CreatePacakges < ActiveRecord::Migration[5.2]
  def change
    create_table :pacakges do |t|
      t.references :subscription, foreign_key: true
      t.references :tea, foreign_key: true
      t.integer :bags

      t.timestamps
    end
  end
end
