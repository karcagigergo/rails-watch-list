Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [ :index, :show, :create ] do
    resources :bookmarks, only: [ :new, :delete ]
  end
end
