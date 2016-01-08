# post '/results' do

#   @seeker = Seeker.create(:seeker_name => params[:seeker_name], 
#   :seeker_rent => params[:seeker_rent], 
#   :seeker_park => params[:seeker_park], 
#   :seeker_activites => params[:seeker_activites],
#   :seeker_architecture => params[:seeker_architecture],  
#   :seeker_commute => params[:seeker_commute])
#   @seekers = Seeker.all
#   all_hoods = Neighborhood.all
#   @matches = @seeker.match(all_hoods)
  
#   binding.pry
#   erb :results
#   end



require 'pry'
class Seeker <ActiveRecord::Base
  has_many :neighborhoods

  #THIS MATCH CODE WORKS!!!!

  def match(neighborhood_array)

    neighborhood_array.each do |neighborhood|
      @new_array = neighborhood_array.where("average_price < ? AND near_park = ? AND stuff_to_do = ? AND time_to_manhattan < ? AND architecture = ?", self.seeker_rent, self.seeker_park, self.seeker_activites, self.seeker_commute, self.seeker_architecture)
      # AND ("near_park == ?", self.seeker_park)
      # AND ("time_to_manhattan < ?", self.seeker_commute)
      end
      @new_array
  end
end

# if @new_array.empty?

# error:  NoMethodError - undefined method `collect' for #<String:0x007faa57922c60>:
#   /Users/flatironschool/Development/code/keren_brooklyn_project/app/controllers/../views/results.erb:4:in `block in singleton class'
  
#     def match(neighborhood_array)

#     neighborhood_array.each do |neighborhood|
#       @new_array = neighborhood_array.where("average_price < ? AND near_park = ? AND stuff_to_do = ? AND time_to_manhattan < ? AND architecture = ?", self.seeker_rent, self.seeker_park, self.seeker_activites, self.seeker_commute, self.seeker_architecture)
#       # AND ("near_park == ?", self.seeker_park)
#       # AND ("time_to_manhattan < ?", self.seeker_commute)
#       end
#       # if @new_array.length > 0
#       if @new_array != []

#       @new_array
#     else 
#       "Sorry, no BK neighborhoods meet your criteria.  May we suggest Staten Island?"
#     end
#   end
# end






 #   if @neighborhood.time_to_manhattan > @seeker.seeker_commute
  #     @matched_hoods.delete(@neighborhood)
  #   end

  #   if @neighborhood.architecture != @seeker.seeker_architecture
  #     @matched_hoods.delete(@neighborhood)
  #   end
# Client.where("orders_count = ? AND locked = ?", params[:orders], false)
#   if @neighborhood.time_to_manhattan > @seeker.seeker_commute
  #     @matched_hoods.delete(@neighborhood)
  #   end
  #   if @seeker.seeker_park == true
  #     @matched_hoods.each do |neighborhood|
  #       if @neighborhood.near_park == false 
  #          @matched_hoods.delete(@neighborhood)
  #       end
  #       @matched_hoods
  #     end
  #   end

  #   if @seeker.seeker_activites == true
  #     @matched_hoods.each do |neighborhood|
  #       if @neighborhood.stuff_to_do == false 
  #          @matched_hoods.delete(@neighborhood)
  #       end
  #       @matched_hoods
  #     end
  #   end

 

  # @matched_hoods

 


# class CreateNeighborhoods < ActiveRecord::Migration
#   def change

#     create_table :neighborhoods do |t|
#       t.string :name
#       t.integer :average_price
#       t.boolean :near_park
#       t.boolean :stuff_to_do
#       t.integer :time_to_manhattan
#       t.string :architecture
  

#     end
#   end

#   class CreateSeekers < ActiveRecord::Migration
#   def change

#     create_table :seekers do |t|
#       t.string :seeker_name
#       t.integer :seeker_rent
#       t.boolean :seeker_park
#       t.boolean :seeker_activites
#       t.string :seeker_architecture
#       t.integer :seeker_commute
#      end
#   end
# end
