class ChatThreadsController < ApplicationController
  def index
    @chat_threads = ChatThread.order(created_at: :desc)
    render json: { chat_threads: @chat_threads }
  end

  def create
    @chat_thread = ChatThread.create(title: 'Untitled')
  end

  def show
    binding.pry
  end
end