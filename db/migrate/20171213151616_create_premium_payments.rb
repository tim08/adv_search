class CreatePremiumPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :premium_payments do |t|
      t.integer :amount
      t.string :uid
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
