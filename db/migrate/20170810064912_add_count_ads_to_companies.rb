class AddCountAdsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :count_ads, :integer
  end
end
