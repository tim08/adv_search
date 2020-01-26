class AddUptoToPromoRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :promo_requests, :upto, :date
  end
end
