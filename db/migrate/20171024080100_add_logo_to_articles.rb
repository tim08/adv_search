class AddLogoToArticles < ActiveRecord::Migration[5.1]
  def up
    add_attachment :articles, :logo
  end

  def down
    remove_attachment :articles, :logo
  end
end
