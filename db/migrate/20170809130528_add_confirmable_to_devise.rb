class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def up
    add_column :companies, :confirmation_token, :string
    add_column :companies, :confirmed_at, :datetime
    add_column :companies, :unconfirmed_email, :string
    add_column :companies, :confirmation_sent_at, :datetime
    add_index :companies, :confirmation_token, unique: true
  end

  def down
    remove_columns :companies, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
