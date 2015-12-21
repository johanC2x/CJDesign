class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :iduserf
      t.integer :idusernewf

      t.timestamps
    end
  end
end
