class RenameContactFieldPromoRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :promo_requests, :contact_email, :string
  end
end
