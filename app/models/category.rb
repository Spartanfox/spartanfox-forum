class Category < ActiveRecord::Base

  has_crud :orderable => true
  has_many :topics, dependent: :destroy

  crud.config do
    fields   title:   { type: :default },
             content: { type: :rich_text }

    config :admin do
      actions only:  [:index, :show, :new, :edit]
      index fields: [:title, :content],
            relations: [:topics],
            order:  { created_at: :desc }
      form  fields: [:title, :content]
      csv   fields: [:title, :content]
    end
  end

  def to_s
    title || "New category"
  end

end
