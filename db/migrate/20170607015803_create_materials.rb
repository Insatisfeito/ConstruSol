class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name

      # Propriedades Térmicas
      t.float :e
      t.float :lambda

      # Impactos Ambientais
      t.float :adp
      t.float :gwp
      t.float :odp
      t.float :ap
      t.float :popc
      t.float :ep
      t.float :enr
      t.float :er

      # Medidas
      t.float :weight
      t.float :cost

      t.boolean :brick
      t.float :brick_height
      t.float :brick_width
      t.float :brick_depth
      t.float :brick_count_meter_square

      t.timestamps
    end
  end
end

