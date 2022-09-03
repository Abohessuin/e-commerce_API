Rails.application.routes.draw do
  scope '/api' do
    resource :product do
      collection do
        get :search
      end
    end  
  end  
end
