class CreateCodigos < ActiveRecord::Migration
  def change
    create_table :codigos do |t|
      t.string :nombre
      t.string :valor
      t.text :descripcion

      t.timestamps
    end
  end
end
