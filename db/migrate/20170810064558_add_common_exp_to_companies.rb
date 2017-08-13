class AddCommonExpToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :common_exp, :integer
  end
end
