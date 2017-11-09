class City < ApplicationRecord
  has_and_belongs_to_many :companies
  has_many :promo_requests
  validates :name, uniqueness: true
end
