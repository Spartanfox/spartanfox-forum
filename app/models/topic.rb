class Topic < ActiveRecord::Base

  has_crud
  belongs_to :category
  has_many :messages, dependent: :destroy

  crud.config do
    fields   title:   { type: :default },
             content: { type: :rich_text }

    config :admin do
      actions only:  [:index, :show, :new, :edit]
      index fields: [:title, :content],
            relations: [:messages],
            order:  { created_at: :desc }
      form  fields: [:title, :content]
      csv   fields: [:title, :content]
    end
  end
end
