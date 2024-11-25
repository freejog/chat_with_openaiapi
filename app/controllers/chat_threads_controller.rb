class ChatThreadsController < ApplicationController
  def index
    @chat_threads = ChatThread.order(created_at: :desc)
    render json: { chat_threads: @chat_threads }
  end

  def create
    @chat_thread = ChatThread.create(title: 'Untitled')
  end

  def show
    @chat_thread = ChatThread.find(params[:id])

    respond_to do |format|
      format.json { render json: { chat_thread: @chat_thread } }
      format.html { render 'messages/index' }
    end
  end
end