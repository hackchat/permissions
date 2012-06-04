Permissions::Application.routes.draw do
  resources :user_room_permissions, :only => [:show, :create, :destroy]
  resources :rooms, :only => :show
  resources :users, :only => :show
end
