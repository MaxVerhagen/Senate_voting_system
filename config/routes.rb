Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  resource :vote, controller: 'votes', only: [:new, :create] do
    collection do
      get 'help'
      get 'thank_you'
    end
  end
  
  #To understand how this works, see https://edgeguides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :parties do
      resources :candidates
    end
  end

  get '/admin', to: redirect('/admin/parties')
  get '/vote', to: redirect('/vote/help')
  get '/admin/vote_count', to: 'application#vote_count'
  post '/admin/vote_count', to: 'application#vote_count'
  
end
