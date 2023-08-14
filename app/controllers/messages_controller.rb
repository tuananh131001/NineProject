class MessagesController < ApplicationController
  def create
    @current_user = current_user
    @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])

    respond_to do |format|
      if @message.save
        format.html { redirect_to room_path(@message.room), notice: 'Room was successfully created' }
        format.json { render :@message.json }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
