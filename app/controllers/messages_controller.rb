class MessagesController < ApplicationController
  def new
    @message = Message.new
    @posts = Post.joins(:categories).where(categories: { name: "Recent Projects" }).published.limit(3)
  end

  def create
    @message = Message.new(message_params)
    @message.clean_arrays
    if @message.save
      redirect_to root_url, notice: "Thank you for reaching out, we'll be in touch!"
    else
      redirect_to root_url, notice: "We're sorry, there was a problem submitting your message. Please contact us at stefanie@example.com"
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body, :phone, :concerns, days: [], times: [], spaces: [])
    end
end
