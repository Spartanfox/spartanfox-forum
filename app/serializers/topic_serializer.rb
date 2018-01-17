class TopicSerializer < ActiveModel::Serializer
  attributes :id, :creator, :title, :content
end
