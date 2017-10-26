class CreateConstrusolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :construsolutions do |t|
      t.string :name
      t.string :ref
      t.integer :construtype
    end
  end
end
