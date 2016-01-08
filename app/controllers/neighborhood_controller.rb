class NeighborhoodController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets



 
end

# CREATE

# Now that we have the database and model set up, it's time to set up the ability to create a blog post.

# First, create a route in your controller, get 'posts/new', that renders the new.erb view.

# We need to create an erb file in the views directory, new.erb, with a form that 
# POSTs to a controller action, /posts. The controller action should use the Create CRUD action to create 
# the blog post and save it to the database. Then, renders, with erb, the index view page.

# end
