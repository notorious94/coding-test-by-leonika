Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
