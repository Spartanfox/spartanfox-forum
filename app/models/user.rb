class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_crud :orderable => true

  has_many :messages
  has_many :topics, through: :messages
  has_many :categories, through: :topics

  crud.config do
    fields   email:    { type: :default },
             username: { type: :default }

    config :admin do
      actions only: [:index, :show, :new, :edit]
      index fields: [:email],
            order:  { created_at: :desc }
      form  fields: [:email, :username]
      csv   fields: [:email, :username]
    end
  end

end
