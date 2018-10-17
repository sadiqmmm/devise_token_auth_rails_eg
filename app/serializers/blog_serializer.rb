class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at
  has_one :user
end
