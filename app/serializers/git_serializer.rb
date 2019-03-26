class GitSerializer < ActiveModel::Serializer
  attributes :id, :date, :amount_completed
end
