class MaterialJoin < ApplicationRecord
  belongs_to :base_material
  belongs_to :material_composition
end
