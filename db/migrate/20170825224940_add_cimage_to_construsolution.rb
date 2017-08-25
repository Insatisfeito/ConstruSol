class AddCimageToConstrusolution < ActiveRecord::Migration[5.1]
  def up
    add_attachment :construsolutions, :cimage
  end

  def down
    remove_attachment :construsolutions, :cimage
  end
end
