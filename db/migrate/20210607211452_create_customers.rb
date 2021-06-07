class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :apartment
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
