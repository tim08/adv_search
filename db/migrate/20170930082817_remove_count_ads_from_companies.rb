class RemoveCountAdsFromCompanies < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :count_ads
  end
end
