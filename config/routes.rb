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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cds#index"
  resources :cds,only:[:show]
    resources :users,only:[:edit,:show, :create, :update,:destroy] do
    resources :carts,only:[:edit,:show,:update] do
     resources :carts_cds,only:[:new,:create,:destroy]
    end
    resources :artist_favorites,only:[:create,:destroy]
    resources :orderlists,only:[:create] do
     resources :orderlist_cds,only:[:create]
    end
    resources :user_comments,only:[:create,:destroy]
  end
    resources :artists,only:[:show,:edit,:update,:destroy]

  namespace :artists do
    resources :artists,only:[:show,:edit,:update,:destroy]
   resources :cds,only:[:index, :new,:create,:show,:edit,:destroy,:update]
   resources :artist_comments,only:[:edit,:destroy,:update]
   resources :songs,only:[:edit,:destroy]
   resources :discs,only:[:edit,:destroy,:update]
  end

  namespace :admins do
   resources :users,only:[:index,:show,:destroy]
   resources :artists,only:[:index,:show,:destroy,:edit,:update,:index]
   resources :admins,only:[:index]
   get "/admins/permit"=>"admin/#permit",as:"admin_permit"
   resources :artist_commnets,only:[:index]
   resources :user_comments,only:[:index]
  end
end