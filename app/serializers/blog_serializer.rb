class BlogSerializer < ActiveModel::Serializer
  attributes :id, :date, :amount_completed, :url
end
