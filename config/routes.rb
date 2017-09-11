Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'matches#index'
  resources 'matches' do
    resources 'games'
  end
  resources 'users'
  resources 'teams'
end
