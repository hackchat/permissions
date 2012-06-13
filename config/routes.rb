Permissions::Application.routes.draw do
  resource :user_room_permission, :only => [:show, :create, :destroy]
  resources :rooms, :only => [:show]
  resources :users, :only => :show
end
