class Admin::MessageOptionsController < AdminController
  def new
    @message_option = MessageOption.new
  end

  def show
    @message_option = MessageOption.find(params[:id])
  end

  def create
    @message_option = MessageOption.new(
      spaces: new_message_option_params[:spaces].split(","),
      times: new_message_option_params[:times].split(",")
    )
    @message_option.save
    redirect_to admin_message_option_path(@message_option), notice: "New Message Options saved."
  end

  private

    def new_message_option_params
      params.require(:message_option).permit(:spaces, :times)
    end
end
