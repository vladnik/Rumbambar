Rumbambar::Engine.routes.draw do

  # AngularJS ngResource
  scope '/api' do
    get    '/:model'     => 'api#index'
    get    '/:model/:id' => 'api#show'
    post   '/:model'     => 'api#create'
    post   '/:model/:id' => 'api#update'
    delete '/:model/:id' => 'api#delete'
  end

  devise_for :rumba_users, path: '', module: :devise
  root to: 'application#index'
end
