module MessageHelper

  def liked(message)
    cookies[message.id.to_s] == "liked"
  end
end
