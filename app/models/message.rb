class Message < ActiveRecord::Base

  has_crud

  belongs_to :topic
  belongs_to :user
  belongs_to :message

  has_many   :messages, dependent: :destroy
  scope :replies, -> (message) { where(message: message) }

  validates_presence_of :content
  validates_length_of :content, :minimum => 2
  validates_length_of :content, :maximum => 500

  crud.config do
    fields  content: { type: :rich_text },
            topic_id: { type: :topic}
    config :admin do
      actions only:  [:index, :show, :new, :edit]
      index fields: [:topic_id, :content],
            order:  { created_at: :desc }
      form  fields: [ :content]
      csv   fields: [ :content]
    end
  end

  def is_reply?
    message
  end
end
