Rails.application.routes.draw do

  get '/logement' => 'welcome#logement'
  root 'welcome#index'
end
