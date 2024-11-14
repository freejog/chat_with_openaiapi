class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    binding.pry
  end
end