class Message < ActiveRecord::Base

  has_crud
  belongs_to :topic
  belongs_to :user

  validates_presence_of :content
  validates_length_of :content, :minimum => 2
  validates_length_of :content, :maximum => 500

end
