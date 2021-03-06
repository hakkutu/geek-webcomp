
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
  passwords:     'admins/passwords'
}

  get 'users/unsubscribe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cds#index"
  resources :cds,only:[:show] do
    resources :user_comments,only:[:create,:destroy]
    resources :cd_favorites,only:[:create,:destroy]
  end
    resources :users,only:[:edit,:show, :create, :update,:destroy] do
    resources :carts,only:[:show] do
     resources :cart_cds,only:[:new,:create,:destroy,:edit,:update]
    end
    resources :orderlists,only:[:create,:new]
  end
    resources :every_artists,only:[:show,:index] do
      resources :artist_favorites,only:[:destroy,:create]
    end

  namespace :artists do
    resources :artists,only:[:show,:edit,:update,:destroy]
   resources :cds,only:[:index, :new,:create,:show,:edit,:destroy,:update] do
    resources :artist_comments,only:[:create,:destroy]
    resources :songs,only:[:edit,:destroy,:update]
   resources :discs,only:[:edit,:destroy,:update]
   end
  end

  namespace :admins do
   resources :users,only:[:index,:edit,:show, :create, :update,:destroy ]
   resources :artists,only:[:index,:show,:destroy,:edit,:update]

   resources :admins,only:[:index]

   
   post "/admins/permit/:id"=>"admins#permit",as:"admin_permit"
  resources :cds, only:[:destroy,:edit,:index,:show,:update] do
   resources :artist_comments,only:[:destroy]
   resources :user_comments,only:[:destroy]
 end
  end
end
