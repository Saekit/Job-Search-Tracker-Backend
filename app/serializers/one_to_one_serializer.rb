class OneToOneSerializer < ActiveModel::Serializer
  attributes :id, :date, :notes
  belongs_to :week
end
