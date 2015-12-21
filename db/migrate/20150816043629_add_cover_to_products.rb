class AddCoverToProducts < ActiveRecord::Migration
  def change
  	add_attachment :products,:cover
  end
end
