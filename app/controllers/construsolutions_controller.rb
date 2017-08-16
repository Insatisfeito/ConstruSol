class ConstrusolutionsController < InheritedResources::Base
  before_action :set_construsolution, only: [ :show, :edit, :update, :destroy]
  def new
    @construsolution = Construsolution.new
  end

  def create
    @construsolution = Construsolution.new(construsolution_params)
    @construsolution.adp = 0
    @construsolution.gwp = 0
    @construsolution.odp = 0
    @construsolution.ap = 0
    @construsolution.popc = 0
    @construsolution.ep = 0
    @construsolution.er = 0
    @construsolution.enr = 0
    respond_to do |format|
      if @construsolution.save
        if @construsolution.construtype == 0
          @construsolution.material_nv_ids.each do |mat|
            if mat != ""
              material = Material.find(mat)
              jt = @construsolution.join_tables.new(material: material)
              jt.construtype = 0
              jt.save
              puts material.to_s
              @construsolution.adp += material.adp * material.weight
              @construsolution.gwp += material.gwp * material.weight
              @construsolution.odp += material.odp * material.weight
              @construsolution.ap += material.ap * material.weight
              @construsolution.popc += material.popc * material.weight
              @construsolution.ep += material.ep * material.weight
              @construsolution.er += material.er * material.weight
              @construsolution.enr += material.enr * material.weight
            end
          end
        else
          @construsolution.material_ext_ids.each do |mat|
            if mat != ""
              material = Material.find(mat)
              jt = @construsolution.join_tables.new(material: material)
              jt.construtype = 0
              jt.save
              @construsolution.adp += material.adp * material.weight
              @construsolution.gwp += material.gwp * material.weight
              @construsolution.odp += material.odp * material.weight
              @construsolution.ap += material.ap * material.weight
              @construsolution.popc += material.popc * material.weight
              @construsolution.ep += material.ep * material.weight
              @construsolution.er += material.er * material.weight
              @construsolution.enr += material.enr * material.weight
            end
          end
          @construsolution.material_int_ids.each do |mat|
            if mat != ""
              material = Material.find(mat)
              jt = @construsolution.join_tables.new(material: material)
              jt.construtype = 1
              jt.save
              @construsolution.adp += material.adp * material.weight
              @construsolution.gwp += material.gwp * material.weight
              @construsolution.odp += material.odp * material.weight
              @construsolution.ap += material.ap * material.weight
              @construsolution.popc += material.popc * material.weight
              @construsolution.ep += material.ep * material.weight
              @construsolution.er += material.er * material.weight
              @construsolution.enr += material.enr * material.weight
            end
          end
        end
        @construsolution.save
        format.html { redirect_to @construsolution, notice: 'Solução Construtiva criada com sucesso.' }
      else
        format.html { render action: 'new' }
      end



    end
  end

  def show
    @calcs = Hash.new
    if @construsolution.construtype == 0
      @calcs[:rsi] = 0.13
      @calcs[:rse] = 0.04
      @calcs[:uNoDiv] = @calcs[:rse] + @calcs[:rsi]
      @calcs[:cost] = 0
      @construsolution.materials.each do |m|
        @calcs[:uNoDiv] += m.e/m.lambda
        @calcs[:cost] += m.cost
      end
      @calcs[:u] = (1 / @calcs[:uNoDiv]).round(4)
    else
      @calcs[:rsi] = 0.13
      @calcs[:rse] = 0.13
      @calcs[:uNoDiv] = @calcs[:rse] + @calcs[:rsi]
      @calcs[:cost] = 0
      @construsolution.join_tables.each do |m|
        material = Material.find(m.material_id)
        @calcs[:cost] += material.cost
        if m.construtype == 1
          @calcs[:uNoDiv] += material.e/material.lambda
          puts "-------------------------------------------"
        end
      end
      @calcs[:u] = (1 / @calcs[:uNoDiv]).round(4)
    end
  end

  private
  def set_construsolution
      if params[:id]
        @construsolution = Construsolution.find(params[:id])
    end
  end

    def construsolution_params
      params.require(:construsolution).permit(:name, :ref, :desc, :from,:adp, :gwp, :odp, :ap, :popc, :ep, :enr, :er, :construtype, material_nv_ids:[], material_int_ids:[], material_ext_ids:[])
    end
end

