class CoOfInterestSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :target_contact, :my_contact
  belongs_to :week
end
