ActionController::Routing::Routes.draw do |map|
  
  map.resources :posts, :collection=>{:rss=>:get}
  map.resources :user_sessions
  map.login '/login', :controller=> "user_sessions", :action=> "new"
  map.about '/about', :controller=>"main", :action=>"about"
  
  map.root :controller => "posts"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
