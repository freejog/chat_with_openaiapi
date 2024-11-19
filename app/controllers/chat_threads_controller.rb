class ChatThreadsController < ApplicationController
  def create
    @chat_thread = ChatThread.create(title: 'Untitled')
  end
end
