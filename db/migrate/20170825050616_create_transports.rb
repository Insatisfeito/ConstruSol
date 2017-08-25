class CreateTransports < ActiveRecord::Migration[5.1]
  def change
    create_table :transports do |t|
      t.string :name
      t.string :simapro_name

      # Impactos Ambientais
      t.float :adp
      t.float :gwp
      t.float :odp
      t.float :ap
      t.float :popc
      t.float :ep
      t.float :enr
      t.float :er
      t.timestamps
    end
  end
end
