Rails.application.routes.draw do

  get 'auth/:provider/callback' => 'authentication#callback'
  get 'auth/failure' => 'authentication#failure'

  get 'venir' => 'welcome#venir'
  get 'logements' => 'welcome#logements'
  root 'welcome#index'
end
