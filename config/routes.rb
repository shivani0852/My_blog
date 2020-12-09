Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :articles do
    resources :comments
  end

  resources :articles do
    resources :likes
  end


  get '/search' => 'articles#search', :as => 'search_page'

end
