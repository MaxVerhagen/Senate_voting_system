Rails.application.routes.draw do
  resources :votes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #To understand how this works, see https://edgeguides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :parties do
      resources :candidates
    end
  end

  get '/admin', to: redirect('/admin/parties')
end
