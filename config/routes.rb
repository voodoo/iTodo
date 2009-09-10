ActionController::Routing::Routes.draw do |map|
 map.about 'about', :controller => 'home'
 map.resources :items, :member => {:update_complete => :post, :update_incomplete => :post}
 map.resources :todos
 map.root :controller => "todos"
end
