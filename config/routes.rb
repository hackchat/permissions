Permissions::Application.routes.draw do
  resource :user_room_permission, :only => [:show]
  resources :rooms, :only => [:show, :create, :destroy]
  resources :users, :only => :show
end
