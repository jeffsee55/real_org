class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to :back, notice: "Thank you for subscribing!"
    else
      redirect_to :back, notice: "There was a problem with your request. Please try again."
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to root_path, notice: "You've successfully unsubscribed."
  end

  def unsubscribe
    if subscriber = Subscriber.read_access_token(params[:signature])
      subscriber.delete
      redirect_to root_url, notice: "Sorry to see you go! You have successfully unsubscribed"
    else
      render text: "Invalid Link"
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:email)
    end

end
