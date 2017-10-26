class CreateBaseMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :base_materials do |t|
      t.string :description
      
      # Impactos Ambientais
      t.float :adp
      t.float :gwp
      t.float :odp
      t.float :ap
      t.float :pocp
      t.float :ep
      t.float :enr
      t.float :er

      # Propriedades Térmicas
      t.float :lambda

      t.timestamps
    end
  end
end
