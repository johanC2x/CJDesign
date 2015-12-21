class RemoveIduserFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :iduser, :integer
  end
end
