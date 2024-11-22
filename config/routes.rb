Rails.application.routes.draw do
  root "messages#index"
  resources :chat_threads, only: [:index, :create, :show] do
    resources :messages, only: [:index, :create]
  end
end