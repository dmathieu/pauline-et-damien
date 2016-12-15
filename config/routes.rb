Rails.application.routes.draw do

  get 'venir' => 'welcome#venir'
  get 'logements' => 'welcome#logements'
  root 'welcome#index'
end
