Rails.application.routes.draw do

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "posts#index"
devise_for :users,
path: '',
path_names: {sign_in: 'login', sign_out: 'logout', edit:'profile',sign_up: 'registration'}
# controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
resources :users, only: [:show, :index, :destroy]
resources :friendships


authenticated :user do
    root 'posts#index', as: :authenticated_root
    end 
resources :posts  do
    resource :like, module: :posts
   
end

resources :posts do
    resource :comments
end
  
end
