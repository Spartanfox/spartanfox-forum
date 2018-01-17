class TopicsController < CrudController

  belongs_to :category

  private

  def permitted_params
    params.permit(topic: [:creator, :title, :content])
  end

end
