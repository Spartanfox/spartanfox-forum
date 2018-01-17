module UserHelper

  def get_username(model)
    model.user.blank? ? "Anon" : model.user.username
  end

end
