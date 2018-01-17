class Message < ActiveRecord::Base

  has_crud
  belongs_to :topic

  belongs_to :user

end
