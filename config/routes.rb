Rails.application.routes.draw do
  scope '/api' do
    resources :products do
      post :search, on: :collection
    end  
  end  
end
