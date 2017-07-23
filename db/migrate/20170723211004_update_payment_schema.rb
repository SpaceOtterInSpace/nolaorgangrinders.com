class UpdatePaymentSchema < ActiveRecord::Migration
  def change
    drop_table :items
    remove_column :orders, :payment_id
    add_column :payments, :user_id, :integer
  end
end
