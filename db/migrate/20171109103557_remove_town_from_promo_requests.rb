class RemoveTownFromPromoRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :promo_requests, :town
  end
end
