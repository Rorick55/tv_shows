TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create]

  resources :television_shows do
    resources :characters
  end

  resources :characters

  resources :actors
end
