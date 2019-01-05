Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cds,only:[:index,:show]
  namespace :users do
  	devise_for :users
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
  end

  namespace :artists do
  	devise_for :artists
  	resources :artists,only:[:show,:edit,:update,:destroy]
  	resources :cds,only:[:new,:create,:show,:edit,:destroy,:update]
  	resources :artist_comments,only:[:edit,:destroy,:update]
  	resources :songs,only:[:edit,:destroy]
  	resources :discs,only:[:edit,:destroy,:update]
  end

  namespace :admins do
  	devise_for :admins
  	resources :users,only:[:index,:show,:destroy]
  	resources :artists,only:[:index,:show,:destroy,:edit,:update,:index]
  	resources :admins,only:[:index]
  	get "/admins/permit"=>"admin/#permit",as:"admin_permit"
  	resources :artist_commnets,only:[:index]
  	resources :user_comments,only:[:index]
  end
end

