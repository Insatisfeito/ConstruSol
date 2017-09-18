class ConstrusolutionsController < InheritedResources::Base
  before_action :set_construsolution, only: [ :show, :edit, :update, :destroy]
  def new
    @construsolution = Construsolution.new
  end

  
  def compare
    @construsolutions = Construsolution.all
  end

  
  def compareResults
    @results = Hash.new
    @calcs = Hash.new
    compare_params_results.each do |constru_id, constru_params|
      constr = Construsolution.find(constru_id)
      @results[constru_id] = Hash.new
      @results[constru_id][:constr] = constr
      @results[constru_id][:adp] = 0
      @results[constru_id][:gwp] = 0
      @results[constru_id][:odp] = 0
      @results[constru_id][:ap] = 0
      @results[constru_id][:popc] = 0
      @results[constru_id][:ep] = 0
      @results[constru_id][:er] = 0
      @results[constru_id][:enr] = 0
      @results[constru_id][:cost] = 0
      @results[constru_id][:materials] = Hash.new
      if constr.construtype == 0
        @calcs[constru_id] = Hash.new
        @calcs[constru_id][:rsi] = 0.13
        @calcs[constru_id][:rse] = 0.04
        @calcs[constru_id][:uNoDiv] = @calcs[constru_id][:rse] + @calcs[constru_id][:rsi]
        @calcs[constru_id][:cost] = 0
        constr.materials.each do |m|
          @calcs[constru_id][:uNoDiv] += m.e/m.lambda
          @calcs[constru_id][:cost] += m.cost
        end
        @calcs[constru_id][:u] = (1 / @calcs[constru_id][:uNoDiv]).round(4)
      else
        @calcs[constru_id] = Hash.new
        @calcs[constru_id][:rsi] = 0.13
        @calcs[constru_id][:rse] = 0.13
        @calcs[constru_id][:uNoDiv] = @calcs[constru_id][:rse] + @calcs[constru_id][:rsi]
        @calcs[constru_id][:cost] = 0
        constr.join_tables.each do |m|
          material = Material.find(m.material_id)
          @calcs[constru_id][:cost] += material.cost
          if m.construtype == 1
            @calcs[constru_id][:uNoDiv] += material.e/material.lambda
          end
        end
        @calcs[constru_id][:u] = (1 / @calcs[constru_id][:uNoDiv]).round(4)
      end
      constru_params.each do |mat_id, mat_params|
        mat = Material.find(mat_id)
        trans = Transport.find(mat_params["transport"]) 
        @results[constru_id][:materials][mat_id] = { "mat" => mat, "transport" => trans, "distance" => mat_params["distance"].to_f}
        @results[constru_id][:adp] += mat.weight * mat_params["distance"].to_f * trans.adp
        @results[constru_id][:gwp] += mat.weight * mat_params["distance"].to_f * trans.gwp
        @results[constru_id][:odp] += mat.weight * mat_params["distance"].to_f * trans.odp
        @results[constru_id][:ap] += mat.weight * mat_params["distance"].to_f * trans.ap
        @results[constru_id][:popc] += mat.weight * mat_params["distance"].to_f * trans.popc
        @results[constru_id][:ep] += mat.weight * mat_params["distance"].to_f * trans.ep
        @results[constru_id][:er] += mat.weight * mat_params["distance"].to_f * trans.er
        @results[constru_id][:enr] += mat.weight * mat_params["distance"].to_f * trans.enr
        @results[constru_id][:cost] += mat.cost
      end
    end
    Rails.logger.debug "#{@results.inspect}"
  end

  def compareStep2
    @construsolutions = []
    compare_params[:solutions_compare_ids].each do |sol|
      if sol != ""
        @construsolutions.push(Construsolution.find(sol))
      end
    end
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
      params.require(:construsolution).permit(:name, :ref, :desc, :from,:adp, :gwp, :odp, :ap, :popc, :ep, :enr, :er, :construtype, :cimage,material_nv_ids:[], material_int_ids:[], material_ext_ids:[])
    end

    def compare_params
      params.require(:solutions_compare).permit(solutions_compare_ids:[])
    end

    def compare_params_results
      params.require(:solutions_compare_results).permit!
    end
end

