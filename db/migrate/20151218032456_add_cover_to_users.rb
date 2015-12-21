class AddCoverToUsers < ActiveRecord::Migration
  def change 
  	add_attachment :users,:cover
  end
end
