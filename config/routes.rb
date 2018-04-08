Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Basic config prior to API conversion 
  
  #post 'user_token' => 'user_token#create'

  root 'static_pages#home'
  #resources :users
  #get '/help',    to: 'static_pages#help'
  #get '/about',   to: 'static_pages#about'
  #get '/contact', to: 'static_pages#contact'
  get '/users/:id', to: 'users#show'

  # Config after API conversion

  scope '/api' do 
    resources :patterns
    post 'user_token' => 'user_token#create'
    get '/users/new',  to: 'users#new'
    post '/users', to: 'users#create'
    #post 'signup' => 'users#create'
  end

end
