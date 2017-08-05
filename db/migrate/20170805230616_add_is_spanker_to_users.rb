class AddIsSpankerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_spanker, :boolean
  end
end
