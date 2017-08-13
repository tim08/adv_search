class AddRadioAdsTypeToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :radio_ads, :boolean, default: false
  end
end
