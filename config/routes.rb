Rails.application.routes.draw do

  get 'logements' => 'welcome#logements'
  root 'welcome#index'
end
