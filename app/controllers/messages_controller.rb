class MessagesController < CrudController

  belongs_to :topic

  def create
    @topic    = parent
    @message  = parent.messages.build(permitted_params[:message])
    @messages = parent.messages
    if user_signed_in?
      @message.user = current_user
    end

    respond_to do |format|
      if @message.save
        @message = Message.new(topic_id: @topic.id)
        format.html { redirect_to @message.post, notice: 'Message sent' }
        format.js   { }
        format.json { render :show, status: :created, location: @message }
      else
        puts "message not saved"
        format.html { render :new }
        format.js   { }
        format.json { render json: @message.errors, status: :unprocessable_entity}
      end
    end
  end

  def rate
    @topic    = parent
    @message  = parent.messages.find(params[:message_id])
    @messages = parent.messages
    unless cookies[@message.id.to_s] == "liked"
      cookies[@message.id.to_s] = "liked"
      @message.rating += 1
      respond_to do |format|
        if @message.save
          format.js   { }
        end
      end
    end
  end
  def request_reply
    @topic    = parent
    @message  = Message.new(topic_id: @topic.id)
    @messages = parent.messages

    @message.message = parent.messages.find(params[:message_id])
    respond_to do |format|
      format.js { }
    end
  end
  private

  def permitted_params
    params.permit(message: [ :content, :message_id], time: [ :last_updated])
  end

end
