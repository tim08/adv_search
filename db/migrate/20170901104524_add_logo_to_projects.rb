class AddLogoToProjects < ActiveRecord::Migration[5.1]
  def up
    add_attachment :projects, :logo
  end

  def down
    remove_attachment :projects, :logo
  end
end
