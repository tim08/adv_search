class AddOtherAdsTypeToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :transport_ads, :boolean, default: false
    add_column :companies, :indoor_ads, :boolean, default: false
    add_column :companies, :mass_media, :boolean, default: false
    add_column :companies, :tv_ads, :boolean, default: false
    add_column :companies, :internet_ids, :boolean, default: false
    add_column :companies, :salepoint_ads, :boolean, default: false
    add_column :companies, :print_services, :boolean, default: false
    add_column :companies, :production_promotional_materials, :boolean, default: false
    add_column :companies, :install_adv_constructions, :boolean, default: false
    add_column :companies, :marketing_research, :boolean, default: false
    add_column :companies, :product_placement, :boolean, default: false
    add_column :companies, :design_services, :boolean, default: false
  end
end
