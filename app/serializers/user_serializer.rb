class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email
  has_many :weeks 
end
