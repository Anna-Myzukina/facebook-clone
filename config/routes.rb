Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  devise_scope :user do
    root to: 'registrations#new'
  end


  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
