class CreateMaterialCompositions < ActiveRecord::Migration[5.1]
  def change
    create_table :material_compositions do |t|
      t.string :description

      t.integer :mtype
      t.float :construction_cost
      t.float :maintenance_cost
      t.float :lambda

      t.timestamps
    end
  end
end
