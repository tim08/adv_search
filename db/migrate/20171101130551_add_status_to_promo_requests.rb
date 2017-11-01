class AddStatusToPromoRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :promo_requests, :status, :integer, default: 0
  end
end
