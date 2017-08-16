class CreateConstrusolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :construsolutions do |t|
      t.string :name
      t.string :ref
      t.string :desc
      t.string :from
      t.integer :construtype

      t.float :adp
      t.float :gwp
      t.float :odp
      t.float :ap
      t.float :popc
      t.float :ep
      t.float :enr
      t.float :er
    end
  end
end
