class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    binding.pry
    openai_api_call(@message.prompt)
  end

  private

  def message_params
    params.require(:message).permit(:prompt)
  end

  def openai_api_call(prompt)
    HTTP.post(
      'https://api.openai.com/v1/chat/completions',
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'Autorization' => "Bearer #{ENV['OPENAI_API_KEY']}"
      },
      json: {
        model: "gpt-4o",
        messages: [{ role: "user", content: prompt }]
      }
    )
  end
end