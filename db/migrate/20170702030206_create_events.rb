class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.boolean :is_public
      t.string :location

      t.timestamps null: false
    end
  end
end
