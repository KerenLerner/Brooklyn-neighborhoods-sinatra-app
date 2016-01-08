class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets



  get '/' do 
    @neighborhoods = Neighborhood.all
    
    #binding.pry
    erb :index
  end

  get '/quiz' do

    erb :quiz
  end

  post '/results' do

  @seeker = Seeker.create(:seeker_name => params[:seeker_name], 
  :seeker_rent => params[:seeker_rent], 
  :seeker_park => params[:seeker_park], 
  :seeker_activites => params[:seeker_activites],
  :seeker_architecture => params[:seeker_architecture],  
  :seeker_commute => params[:seeker_commute])
  all_neighborhoods = Neighborhood.all

  @matches = @seeker.match(all_neighborhoods)
  #binding.pry
  
  erb :results
  end

  #binding.pry
  # redirect to '/posts/#{@post.id}'



 get '/add_neighborhood' do 
    erb :add_neighborhood
  end

post '/new_neighborhood_success' do
  @neighborhood = Neighborhood.create(:name => params[:name], :average_price => params[:average_price], :near_park => params[:near_park], :stuff_to_do => params[:stuff_to_do], :time_to_manhattan => params[:time_to_manhattan], :architecture => params[:architecture])
  erb :new_neighborhood_success
end

get '/neighborhood/:id' do

  @neighborhood = Neighborhood.find_by_id(params[:id])
  erb :show_neighborhood
end


# get '/neighborhood/:id/edit' do  #load edit form
#     @neighborhood = Neighborhood.find_by_id(params[:id])
#     erb :edit_neighborhood
#     end

# post '/neighborhood/:id' do #edit action
#       #binding.pry
#       @neighborhood = Post.find_by_id(params[:id])
#       @neighborhood.name = params[:name]
#       @neighborhood.average_price = params[:average_price]
#       @neighborhood.near_park = params[:near_park]
#       @neighborhood.stuff_to_do = params[:stuff_to_do]
#       @neighborhood.architecture = params[:architecture]
#       @neighborhood.time_to_manhattan = params[:time_to_manhattan]

#       @neighborhood.save
#       redirect "/neighborhood/#{@post.id}"
#     end

get '/neighborhood/:id/delete' do #delete action
  @neighborhood = Neighborhood.find_by_id(params[:id])
  # @post.delete
  erb :show_neighborhood
  # redirect to '/posts'
end

post '/:id/deleted_neighborhood' do #delete action
  @neighborhood = Neighborhood.find_by_id(params[:id])
  #binding.pry
  @neighborhood.delete

  erb :deleted_neighborhood
  # redirect "/index"
end



end




# post '/posts/:id/delete' do #delete action
#   @post = Post.find_by_id(params[:id])
#   @post.delete
#   redirect to '/posts'
# end
# On the blog post show page, we have a form to delete it. The form is submitted via a POST 
# request (again, because Sinatra can't handle DELETE requests) to the route /posts/:id/delete. 
# This action finds the blog post in the database based on the ID in the url parameters, and deletes it. It then redirects to the index page /posts.
