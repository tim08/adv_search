class AddMinOrderPriceToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :min_order_price, :integer
  end
end
