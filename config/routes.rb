
Rails.application.routes.draw do
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
devise_for :artists, controllers: {
  sessions:      'artists/sessions',
  passwords:     'artists/passwords',
  registrations: 'artists/registrations'
}

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  get 'users/unsubscribe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cds#index"
  resources :cds,only:[:show] do
    resources :cd_favorites,only:[:create,:destroy]
  end
    resources :users,only:[:edit,:show, :create, :update,:destroy] do
    resources :carts,only:[:edit,:show,:update] do
     resources :carts_cds,only:[:new,:create,:destroy]
    end
    resources :orderlists,only:[:create] do
     resources :orderlist_cds,only:[:create]
    end
    resources :user_comments,only:[:create,:destroy]
  end
    resources :every_artists,only:[:show,:index] do
      resources :artist_favorites,only:[:destroy,:create]
    end

  namespace :artists do
    resources :artists,only:[:show,:edit,:update,:destroy]
   resources :cds,only:[:index, :new,:create,:show,:edit,:destroy,:update] do
    resources :songs,only:[:edit,:destroy]
   resources :discs,only:[:edit,:destroy,:update]
   end
   resources :artist_comments,only:[:edit,:destroy,:update]
  
  end

  namespace :admins do
   resources :users,only:[:index,:show,:destroy]
   resources :artists,only:[:index,:show,:destroy,:edit,:update,:index]
   resources :admins,only:[:index]
   resources :cds, only:[:show]
   get "/admins/permit"=>"admin/#permit",as:"admin_permit"
   resources :artist_commnets,only:[:index]
   resources :user_comments,only:[:index]
  end
end