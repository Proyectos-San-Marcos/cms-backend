Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'
  end

  resources :users
  resources :managements
  resources :areas
  resources :faculties
  resources :careers
  resources :projects

  post '/graphql', to: 'graphql#execute'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
