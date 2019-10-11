Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions',
 :passwords     => 'users/passwords'
 
  }
  
  resources :posts 
  #root 'posts#index'
  root 'home#top'
  resources :home, only: [:top]
  resources :users, only: [:show] do
  member do
   get 'likes'
   get 'likes_events'
   get 'events'
   get 'chats'
   get 'following'
   get 'followers'
  end
 end
 
  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
  post 'likes/:event_id/create_event' => 'likes#create_event'
  post 'likes/:event_id/destroy_event' => 'likes#destroy_event'
  
  resources :events 
  resources :messages, only: [:create, :destroy]
  resources :talks, only: [:create, :destroy]
  resources :chats, only:[:show, :create] 
  resources :my_areas, only:[:create, :destroy]
  get 'my_areas/:user_id/new' => 'my_areas#new'
  resources :friends, only:[:create]
  get 'notifications/post_event_index' => 'notifications#post_event_index'
  get 'notifications/friends_index' => 'notifications#friends_index'
  get 'notifications/chats_index' => 'notifications#chats_index'
  
  resources :inquiries, only:[:index, :new, :create]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
