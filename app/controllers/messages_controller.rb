class MessagesController < ApplicationController

  before_filter :authenticate_user!

  # GET /messages
  # GET /messages.json
  def index
    if params[:last_message_id]
      @messages = Message.where("id > ?", params[:last_message_id])
    else
      @messages = Message.limit(5).order(:created_at).reverse_order
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.user_id = current_user.id
    
    respond_to do |format|
      if @message.save
        format.json { render json: @message, status: :created}
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end
end
