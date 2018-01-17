class DownloadSerializer < ActiveModel::Serializer
  attributes :id, :name, :download_type, :download_address, :downloads_count, :info
end
