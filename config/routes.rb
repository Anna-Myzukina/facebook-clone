Rails.application.routes.draw do

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "posts#index"
devise_for :users,
path: '',
path_names: {sign_in: 'login', sign_out: 'logout', edit:'profile',sign_up: 'registration'}
# controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
resource :users, only: [:show]
resources :posts

  
end
