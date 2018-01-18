module ApplicationHelper
  def get_date(model)
    model.created_at.strftime("%D - %I:%M %p")
  end
end
