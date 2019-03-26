class GitSerializer < ActiveModel::Serializer
  attributes :id, :date, :amount_completed
  belongs_to :week
end
