class MessagesController < CrudController

  belongs_to :topic

  def create
    #binding.pry
    @message = parent.messages.build(permitted_params[:message])
    if user_signed_in?
      @message.user = current_user
    end

    if @message.save
      redirect_to topic_messages_path(parent)
    else
      render 'new'
    end

  end


  private

  def permitted_params
    params.permit(message: [ :content ])
  end

end
