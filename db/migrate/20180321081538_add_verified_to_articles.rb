class AddVerifiedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :verified, :boolean, default: false
  end
end
