class AddExpirationDateOfPremiumToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :expiration_date_of_premium, :date, default: Date.new(1987, 9, 14)
  end
end
