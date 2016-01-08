class CreateSeekers < ActiveRecord::Migration
  def change

    create_table :seekers do |t|
      t.string :seeker_name
      t.integer :seeker_rent
      t.boolean :seeker_park
      t.boolean :seeker_activites
      t.string :seeker_architecture
      t.integer :seeker_commute
     end
  end
end
