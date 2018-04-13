Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, shallow: true

  end

  get "/arbi", to: "cocktails#index"
end
