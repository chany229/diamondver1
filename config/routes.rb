Rails.application.routes.draw do

  namespace :admin do
    resources :comments
  end
  namespace :admin do
    resources :abouts
  end
  namespace :admin do
    resources :entries
  end
  namespace :admin do
    resources :categories
  end
  get '/admin/index', as: :admin

  resource :session, only: %i(new create destroy)

  get '/get_works' => 'home#get_works'
  get '/get_entry/:id' => 'home#get_entry'
  get '/get_top' => 'home#get_top'
  get '/get_tags' => 'home#get_tags'
  get '/get_contact' => 'home#get_contact'
  get '/get_tag/:tag' => 'home#get_tag'

  post '/comment' => 'home#comment'

  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
