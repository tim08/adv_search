class Article < ApplicationRecord

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  validates_attachment_size :logo, less_than: 5.megabytes

  belongs_to :company, optional: true
  belongs_to :admin, optional: true

  scope :verified, -> { where(verified: true) }

end
