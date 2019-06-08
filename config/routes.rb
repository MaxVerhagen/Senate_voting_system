Rails.application.routes.draw do
  resources :votes
  get 'vote/thankyou' => 'votes#thank_you', as: :vote_thank_you
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
  
  scope '/vote' do
    root to: "application#vote"
  end 
  #To understand how this works, see https://edgeguides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :parties do
      resources :candidates
    end
  end
  

  get '/admin', to: redirect('/admin/parties')
  
end
