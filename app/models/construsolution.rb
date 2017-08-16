class Construsolution < ApplicationRecord
  has_many :join_tables
  has_many :materials, through: :join_tables

  attr_accessor :material_nv_ids, :material_int_ids, :material_ext_ids
end
