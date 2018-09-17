class Project < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  has_attached_file :logo, styles: {large: "900x600", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  validates_attachment_size :logo, less_than: 5.megabytes
end
