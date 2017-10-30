class Construsolution < ApplicationRecord
  has_many :join_tables
  has_many :material_compositions, through: :join_tables
  has_attached_file :cimage, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cimage, content_type: /\Aimage\/.*\z/

  def costsC
    @costs = 0
    self.material_compositions.each do |m|
      @costs += m.construction_cost
    end
    @costs
  end

  def costsM
    @costs = 0
    self.material_compositions.each do |m|
      @costs += m.maintenance_cost
    end
    @costs
  end 

  def calcImpacts
    @calcs = Hash.new
    @calcs[:adp] = 0
    @calcs[:gwp] = 0
    @calcs[:odp] = 0
    @calcs[:ap] = 0
    @calcs[:pocp] = 0
    @calcs[:ep] = 0
    @calcs[:er] = 0
    @calcs[:enr] = 0
    self.material_compositions.each do |mj|
      impacts = mj.impacts
      @calcs[:adp] += impacts[:adp]
      @calcs[:gwp] += impacts[:gwp]
      @calcs[:odp] += impacts[:odp]
      @calcs[:ap] += impacts[:ap]
      @calcs[:pocp] += impacts[:pocp]
      @calcs[:ep] += impacts[:ep]
      @calcs[:er] += impacts[:er]
      @calcs[:enr] += impacts[:enr]
    end
    @calcs
  end
  attr_accessor :material_nv_ids, :material_int_ids, :material_ext_ids, :adp, :gwp, :odp, :ap, :pocp, :ep, :enr, :er, :impacts
end
