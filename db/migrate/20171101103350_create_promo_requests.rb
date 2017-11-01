class CreatePromoRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :promo_requests do |t|
      t.string :name
      t.string :town
      t.integer :min_order_price
      t.text :description
      t.string :contact_details

      t.timestamps
    end
  end
end
