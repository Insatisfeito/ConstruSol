class CreateJoinTables < ActiveRecord::Migration[5.1]
  def change
    create_table :join_tables do |t|
      t.integer :construsolution_id
      t.integer :material_composition_id
      t.integer :construtype

      t.timestamps
    end
    add_index :join_tables, [:construsolution_id, :material_composition_id], name: :idx_constr_material_comp
  end
end
