class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.boolean :is_payed
      t.datetime :date
      t.integer :zip_code
      t.string :city
      t.string :street
      t.integer :number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
