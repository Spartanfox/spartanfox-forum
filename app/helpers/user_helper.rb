module UserHelper

  def get_username(model)
    model.user.blank? ? "Anon" : model.user.username
  end
  def username
    user_signed_in? ? current_user.username : "Anon"
  end
end
