class CategoriesController < CrudController

  def index
    @categories = Category.ordered
  end


end
