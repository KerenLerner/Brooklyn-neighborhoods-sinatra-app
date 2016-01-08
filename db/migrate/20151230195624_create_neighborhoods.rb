class CreateNeighborhoods < ActiveRecord::Migration
  def change

    create_table :neighborhoods do |t|
      t.string :name
      t.integer :average_price
      t.boolean :near_park
      t.boolean :stuff_to_do
      t.integer :time_to_manhattan
      t.string :architecture
  

    end
  end
end
