Rails.application.routes.draw do
  root "messages#index"
  resources :chat_threads, only: [:create] do
    resources :messages, only: [:index, :create]
  end
end