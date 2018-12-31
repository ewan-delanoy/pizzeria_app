class Admin < ApplicationRecord
  has_many :orders
  validates :name, presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 25 }
end
