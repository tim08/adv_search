class AddAdvTypeToPromoRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :promo_requests, :adv_type, :string, default: false
  end
end
