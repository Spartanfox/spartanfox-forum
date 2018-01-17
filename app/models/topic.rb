class Topic < ActiveRecord::Base

  has_crud
  belongs_to :category
  has_many :messages, dependent: :destroy

end
