class CreateMaterialJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :material_joins do |t|
      t.integer :base_material_id
      t.integer :material_composition_id

      t.float :width
      t.float :weight

      t.timestamps
    end
    add_index :material_joins, [:base_material_id, :material_composition_id], name: :idx_material_material_comp
  end
end
