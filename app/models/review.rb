class Review < ApplicationRecord
  belongs_to :company
  enum type_review: ['положительное', 'отрицательное']

  scope :verified, -> {where(verified: true)}

  validates :name, presence: true
end
