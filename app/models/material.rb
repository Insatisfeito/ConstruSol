class Material < ApplicationRecord
  after_save do |material|
    if material.brick == true
      argamassa = Material.new
      argamassa.name = "Argamassa de assentamento (" + material.name + ")"
      argamassa.e = 0
      argamassa.lambda = 1.3
      argamassa.adp = 0.000000203
      argamassa.gwp = 0.309
      argamassa.odp = 0.0000000158
      argamassa.ap = 0.00102
      argamassa.popc = 0.0000442
      argamassa.ep = 0.000297
      argamassa.enr = 2.120129
      argamassa.er = 0.24478
      argamassa.brick = false
      form1 = ((material.brick_width * 0.01) + ((material.brick_height + 0.01) * 0.01) ) * material.brick_depth
      form2 = form1 * material.brick_count_meter_square
      form3 = form2 * 1900
  
      puts "A criar automaticamente #{argamassa.name}."
  
      argamassa.weight = form3 
      argamassa.cost = form3 * 0.13
      argamassa.save
    end
  end

  has_many :join_tables
  has_many :construsolutions, through: :join_tables
  
end
