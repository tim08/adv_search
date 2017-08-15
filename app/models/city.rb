class City < ApplicationRecord
  has_and_belongs_to_many :companies
  validates :name, uniqueness: true
end
