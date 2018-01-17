class Download < ActiveRecord::Base

  has_crud :orderable => true

  crud.config do
    fields   name:             { type: :default },
             info:             { type: :rich_text },
             type:             { type: :default },
             download_address: { type: :default },
             downloads_count:  { type: :default }

    config :admin do
      actions only:  [:index, :show, :new, :edit]
      index fields: [:name,  :download_type, :download_address, :downloads_count, :info],
            order:  { created_at: :desc }
      form  fields: [:name, :download_type, :download_address, :downloads_count, :info]
      csv   fields: [:name, :download_type, :download_address, :downloads_count, :info]
    end
  end

end
