class BaseMaterial < ApplicationRecord
  has_many :material_joins
  has_many :material_compositions, through: :material_joins
end
