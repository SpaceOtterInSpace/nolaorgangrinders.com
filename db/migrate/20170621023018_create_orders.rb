class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.date :due_date
      t.integer :user_id
      t.integer :payment_id
      t.timestamps null: false
    end
  end
end
