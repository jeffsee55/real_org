class Admin::MessagesOptionsController < AdminController
  def show
  end

  def create
    @message_options = MessageOptions.new(message_options_params)
    @message_options.save
    redirect_to :back, notice: "New Message Options saved."
  end

  private
    def get_message
      @message = Message.find(params[:id])
    end
end
