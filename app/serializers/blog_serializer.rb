class BlogSerializer < ActiveModel::Serializer
  attributes :id, :date, :amount_completed, :url
  belongs_to :week
end
