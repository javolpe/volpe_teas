class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :price
      t.string :title
      t.boolean :status
      t.string :frequency

      t.timestamps
    end
  end
end
