class MaterialComposition < ApplicationRecord
  has_many :material_joins
  has_many :base_materials, through: :material_joins

  has_many :join_tables
  has_many :construsolutions, through: :join_tables

  def calcWidth
    @mat_width = 0
    puts self.description
    self.material_joins.each do |m|
      @mat_width += m[:width]
    end
    @mat_width.round(8)
  end

  def calcWeight
    @mat_weight = 0
    self.material_joins.each do |m|
      @mat_weight += m[:weight]
    end
    @mat_weight
  end

  def calcLambda
    @mat_lambda = 0
    if self.mtype == 0
      self.base_materials.each do |m|
        @mat_lambda += m[:lambda]
      end
    else
      @mat_lambda = self[:lambda]
    end
    @mat_lambda
  end

  def calcR
    self.calcWidth / self.calcLambda
  end

  def impacts
    @calcs = Hash.new
    @calcs[:adp] = 0
    @calcs[:gwp] = 0
    @calcs[:odp] = 0
    @calcs[:ap] = 0
    @calcs[:pocp] = 0
    @calcs[:ep] = 0
    @calcs[:er] = 0
    @calcs[:enr] = 0
    self.material_joins.each do |mj|
      material = BaseMaterial.find(mj.base_material_id)
      @calcs[:adp] += mj.weight * material[:adp]
      @calcs[:gwp] += mj.weight * material[:gwp]
      @calcs[:odp] += mj.weight * material[:odp]
      @calcs[:ap] += mj.weight * material[:ap]
      @calcs[:pocp] += mj.weight * material[:pocp]
      @calcs[:ep] += mj.weight * material[:ep]
      @calcs[:er] += mj.weight * material[:er]
      @calcs[:enr] += mj.weight * material[:enr]
    end
    @calcs
  end

  attr_accessor :adp, :gwp, :odp, :ap, :pocp, :impactsCalc, :ep, :er, :enr, :material_composition_add_0, :material_composition_add, :material_composition_add, :width, :weight, :lambda, :material_composition_add_1, :width_1, :weight_1, :width_0, :weight_0, :lambda_0, :type_name, :weight_calc, :width_calc, :lambda_1 , :material_composition_add_2, :width_2, :weight_2
end
