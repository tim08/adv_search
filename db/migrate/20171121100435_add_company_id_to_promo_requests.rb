class AddCompanyIdToPromoRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :promo_requests, :company, foreign_key: true
  end
end
