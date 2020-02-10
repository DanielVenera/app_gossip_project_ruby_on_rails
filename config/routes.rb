Rails.application.routes.draw do
  get 'gossip/show_gossip/:id', to: 'gossip#show_gossip' 
  get 'welcome/:first_name', to: 'welcome#first_name'
  get 'static_pages/home', to: 'static_pages#home'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'author/:id', to: 'author#author_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
