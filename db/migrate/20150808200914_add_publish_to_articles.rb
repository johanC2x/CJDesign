class AddPublishToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :publish, :integer
  end
end
