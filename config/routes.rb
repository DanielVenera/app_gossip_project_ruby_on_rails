Rails.application.routes.draw do
  root 'home#show'
  get 'gossip/:id', to: 'gossip#show_gossip' 
  get 'welcome/:first_name', to: 'welcome#first_name'
  get 'team', to: 'team#team'
  get 'contact', to: 'contact#contact'
  get 'author/:id', to: 'author#author_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
