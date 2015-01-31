Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations"}


  # Admin Facing Views
  resources :beer_styles,
            :path       => "admin/beer-styles",
            :controller => "admin_facing/beer_styles",
            :as         => :admin_beer_styles,
            :except     => [:show, :destroy]

  # Public Facing Views
  resources :beer_styles,
            :path       => "beer-styles",
            :controller => "public_facing/beer_styles",
            :only       => [:show, :index]
  
  resources :breweries,
            :controller => "public_facing/breweries",
            :except     => [:destroy] do

    resources :batches,
              :controller => "public_facing/batches" do
      
      resources :access_invitations,
                :path => "invites",
                :controller => "public_facing/access_invitations",
                :only => [:create, :destroy]

    end

    resources :access_invitations,
              :path => "invites",
              :controller => "public_facing/access_invitations",
              :only => [:create, :destroy] do

      member do
        get :authorize
      end
    end

    member do
      get :remove_member
    end

    get '/members', to: 'public_facing/breweries#members', as: 'members'
  end

  root to: "public_facing/breweries#index"
end
