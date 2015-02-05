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

  resources :recipes,
            :controller => "public_facing/recipes",
            :except => [:show, :edit]
  
  resources :breweries,
            :controller => "public_facing/breweries",
            :except     => [:destroy] do

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

  resources :batches,
            :controller => "public_facing/batches",
            :except => [:show, :edit] do
    
    resources :access_invitations,
              :path => "invites",
              :controller => "public_facing/access_invitations",
              :only => [:create, :destroy]

  end

  resources :users,
            :controller => "users/pages",
            :path       => "brewers",
            :only       => [:index] do
    member do
      get :show
    end

  end

  get 'dashboard' => 'users/pages#dashboard', as: :user_dashboard

  # User Batch Routes
  get 'brewers/:id/batches' => 'users/pages#batches', as: :user_batches
  get 'brewers/:author_id/batches/:id' => 'public_facing/batches#show', as: :user_batch
  get 'brewers/:author_id/batches/:id/edit' => 'public_facing/batches#edit', as: :edit_user_batch

  # User Batch Routes
  get 'brewers/:id/recipes' => 'users/pages#recipes', as: :user_recipes
  get 'brewers/:author_id/recipes/:id' => 'public_facing/recipes#show', as: :user_recipe
  get 'brewers/:author_id/recipes/:id/edit' => 'public_facing/recipes#edit', as: :edit_user_recipe

  root to: "public_facing/pages#home"
end
