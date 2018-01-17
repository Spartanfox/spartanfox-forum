class MessageSerializer < ActiveModel::Serializer
  attributes :id, :creator, :content
end
