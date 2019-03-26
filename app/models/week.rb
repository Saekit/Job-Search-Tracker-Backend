class Week < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :gits
  has_many :blogs
  has_many :one_to_ones
  has_many :co_of_interests
end
