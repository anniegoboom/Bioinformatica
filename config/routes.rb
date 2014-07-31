Bioinformatica::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :info_snippets, :only => [:show, :index] do
    resources :tags, :only => [:index]
  end

  resources :tags, :only => [:show, :index] do
    resources :info_snippets, :only => [:index]
    resources :programs, :only => [:index]
  end

  resources :tag_types, :only => [:show] do
    resources :tags, :only => [:index]
  end

  resources :programs, :only => [:show, :index] do
    resources :tags, :only => [:index]
  end

  resources :companies

  root :to => 'bioinformatica#index'
end
