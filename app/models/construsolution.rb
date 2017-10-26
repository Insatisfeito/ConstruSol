class Construsolution < ApplicationRecord
  has_many :join_tables
  has_many :material_compositions, through: :join_tables
  has_attached_file :cimage, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cimage, content_type: /\Aimage\/.*\z/

  attr_accessor :material_nv_ids, :material_int_ids, :material_ext_ids,:adp, :gwp, :odp, :ap, :popc, :ep, :enr, :er
end
