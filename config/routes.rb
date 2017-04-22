Rails.application.routes.draw do
  namespace 'admin' do
    resources :presents
    root 'main#index'
  end

  get 'auth/:provider/callback' => 'authentication#callback'
  get 'auth/failure' => 'authentication#failure'

  get 'venir' => 'welcome#venir'
  get 'logements' => 'welcome#logements'
  get 'rsvp' => 'welcome#rsvp'
  get 'mariage-civil' => 'welcome#civil'

  get 'liste-mariage' => 'welcome#presents'
  post 'payments' => 'welcome#payment'

  root 'welcome#index'
end
