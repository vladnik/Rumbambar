Rumbambar::Engine.routes.draw do
  devise_for :rumba_users, path: '', module: :devise
  root to: 'application#index'
end
