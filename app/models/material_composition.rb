class MaterialComposition < ApplicationRecord
  has_many :material_joins
  has_many :base_materials, through: :material_joins

  has_many :construsolutions
  has_many :construsolutions, through: :join_tables

  attr_accessor :adp, :gwp, :odp, :ap, :pocp, :ep, :er, :enr, :material_composition_add, :material_composition_add, :width, :weight, :lambda, :material_composition_add_1, :width_1, :weight_1, :width_0, :weight_0, :lambda_0, :type_name, :weight_calc, :width_calc, :lambda_1 , :material_composition_add_2, :width_2, :weight_2
end
