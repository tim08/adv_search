class AddPromoRequestRefToCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :promo_requests, :city, foreign_key: true
  end
end
