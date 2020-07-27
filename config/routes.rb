Rails.application.routes.draw do
  root 'welcome#home'
  # devise_for :users

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, :only => [:show, :index]
  resources :projects do
  	resources :bugs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
