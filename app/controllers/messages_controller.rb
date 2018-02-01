class MessagesController < CrudController

  belongs_to :topic

  def create
    @topic    = parent
    @reply  = parent.messages.build(permitted_params[:message])
    @message = @reply.message
    if user_signed_in?
      @reply.user = current_user
    end
    respond_to do |format|
      if @reply.save
        @messages = parent.messages.replies(@reply.message).sort{|a,b| a.created_at <=> b.created_at}
        format.html { redirect_to @reply.post, notice: 'Message sent' }
        format.js   { }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new }
        format.js   { }
        format.json { render json: @reply.errors, status: :unprocessable_entity}
      end
    end
  end

  def rate
    @topic    = parent
    @reply  = parent.messages.find(params[:message_id])
    @messages = parent.messages
    unless cookies[@reply.id.to_s] == "liked"
      cookies[@reply.id.to_s] = "liked"
      @reply.rating += 1
      respond_to do |format|
        if @reply.save
          format.js { }
        end
      end
    end
  end

  def reply
    @topic    = parent
    @reply  = Message.new(topic_id: @topic.id)
    @message =  parent.messages.find(params[:message_id])
    @reply.message = @message
    respond_to do |format|
      format.js { }
    end
  end

  def view_replies
    @topic    = parent
    @message  = parent.messages.find(params[:message_id])
    @messages = parent.messages.replies(@message).sort{|a,b| a.created_at <=> b.created_at}
    respond_to do |format|
      format.js { }
    end
  end

private

  def permitted_params
    params.permit(message: [ :content, :message_id], time: [ :last_updated])
  end

  def valid?(message, reply)
    true #message && reply && message.topic_id == reply.topic_id
  end

end
