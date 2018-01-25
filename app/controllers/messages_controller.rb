class MessagesController < CrudController

  belongs_to :topic

  def create
    @message = parent.messages.build(permitted_params[:message])

    @topic = parent
    if user_signed_in?
      @message.user = current_user
    end
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message.post, notice: 'Message sent' }
        format.js   { }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.js   { }
        format.json { render json: @message.errors, status: :unprocessable_entity}
      end
    end
  end
  def rate
    @topic = parent
    @message = parent.messages.find(params[:message_id])
    unless cookies[@message.id.to_s] == "liked"
      cookies[@message.id.to_s] = "liked"
      @message.rating += 1
      @message.save
    end
    redirect_to :back
  end

  private

  def permitted_params
    params.permit(message: [ :content ])
  end

end
