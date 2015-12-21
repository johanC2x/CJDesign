class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :titles 
      t.text :description
      t.integer :visit

      t.timestamps
    end
  end
end
