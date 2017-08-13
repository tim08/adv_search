class AddAdsTypeToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :promo, :boolean, default: false
    add_column :companies, :direct_mail, :boolean, default: false
    add_column :companies, :outdoor_ads, :boolean, default: false
  end
end
