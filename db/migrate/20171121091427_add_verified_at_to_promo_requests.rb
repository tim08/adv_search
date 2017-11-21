class AddVerifiedAtToPromoRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :promo_requests, :verified_at, :datetime
  end
end
