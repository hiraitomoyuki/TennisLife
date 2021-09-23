Rails.application.routes.draw do
  
  root 'homes#top'
  get 'homes/about'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  resources :users do
    get '/bookmarks' => 'users#bookmarks', on: :member
    get '/favorites' => 'users#favorites', on: :member
    get '/entries' => 'users#entries', on: :member
  end

  get '/confirm' => 'users#confirm'

  resources :circles, shallow: true do
    resource :bookmarks, only: %i(create destroy)
    resource :relationships, only: [:create, :destroy]
    resources :approvals, only: [:create, :destroy]
    get '/matching' => 'relationships#matching'
    get :bookmarks, on: :collection
    member do
      get '/calendar' => 'circles#calendar'
      get '/map' => 'circles#map'
      get '/member' => 'circles#member'
      get '/approvals' => 'circles#approvals'
    end
  end

  resources :events do
    resource :entries, only: [:create, :destroy]
  end

  get '/search' => 'circles#search'
  get '/circle_search' => 'circles#circle_search'

  resources :articles do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :notifications, only: [:index]
  
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirms'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  
  resources :topics, only: [:index, :show, :create, :destroy]
  
  resources :posts, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
