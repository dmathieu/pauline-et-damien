Rails.application.routes.draw do
  namespace 'admin' do
    root 'main#index'
  end

  get 'auth/:provider/callback' => 'authentication#callback'
  get 'auth/failure' => 'authentication#failure'

  get 'venir' => 'welcome#venir'
  get 'logements' => 'welcome#logements'
  root 'welcome#index'
end
