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
      @results[constru_id][:impacts] = Hash.new
      @results[constru_id][:materials] = Hash.new
      if constr.construtype == 0
        @calcs[constru_id] = Hash.new
        @calcs[constru_id][:rsi] = 0.13
        @calcs[constru_id][:rse] = 0.04
        @calcs[constru_id][:uNoDiv] = @calcs[constru_id][:rse] + @calcs[constru_id][:rsi]
        @calcs[constru_id][:cost_c] = 0
        @calcs[constru_id][:cost_m] = 0
        constr.material_compositions.each do |m|
          @calcs[constru_id][:uNoDiv] += m.calcR
          @calcs[constru_id][:cost_c] += m.construction_cost
          @calcs[constru_id][:cost_m] += m.maintenance_cost
        end
        @calcs[constru_id][:u] = (1 / @calcs[constru_id][:uNoDiv]).round(4)
      else
        @calcs[constru_id] = Hash.new
        @calcs[constru_id][:rsi] = 0.13
        @calcs[constru_id][:rse] = 0.13
        @calcs[constru_id][:uNoDiv] = @calcs[constru_id][:rse] + @calcs[constru_id][:rsi]
        @calcs[constru_id][:cost_c] = 0
        @calcs[constru_id][:cost_m] = 0
        constr.join_tables.each do |m|
          material = MaterialComposition.find(m.material_composition_id)
          if m.construtype == 1
            @calcs[constru_id][:uNoDiv] += material.calcR
            @calcs[constru_id][:cost_c] += material.construction_cost
            @calcs[constru_id][:cost_m] += material.maintenance_cost
          end
        end
        @calcs[constru_id][:u] = (1 / @calcs[constru_id][:uNoDiv]).round(4)
      end
      @results[constru_id][:impacts][:adp] = 0
      @results[constru_id][:impacts][:gwp] = 0
      @results[constru_id][:impacts][:odp] = 0
      @results[constru_id][:impacts][:ap] = 0
      @results[constru_id][:impacts][:pocp] = 0
      @results[constru_id][:impacts][:ep] = 0
      @results[constru_id][:impacts][:er] = 0
      @results[constru_id][:impacts][:enr] = 0
      constru_params.each do |mat_id, mat_params|
        mat = MaterialComposition.find(mat_id)
        trans = Transport.find(mat_params["transport"]) 
        puts mat.calcWeight.to_s + ' -> ' + mat_params["distance"] + ' -> ' + trans.adp.to_s + ' == ' + (mat.calcWeight * mat_params["distance"].to_f * trans.adp).to_s
        @results[constru_id][:materials][mat_id] = { "mat" => mat, "transport" => trans, "distance" => mat_params["distance"].to_f}
        @results[constru_id][:impacts][:adp] += mat.calcWeight * mat_params["distance"].to_f * trans.adp
        @results[constru_id][:impacts][:gwp] += mat.calcWeight * mat_params["distance"].to_f * trans.gwp
        @results[constru_id][:impacts][:odp] += mat.calcWeight * mat_params["distance"].to_f * trans.odp
        @results[constru_id][:impacts][:ap] += mat.calcWeight * mat_params["distance"].to_f * trans.ap
        @results[constru_id][:impacts][:pocp] += mat.calcWeight * mat_params["distance"].to_f * trans.popc
        @results[constru_id][:impacts][:ep] += mat.calcWeight * mat_params["distance"].to_f * trans.ep
        @results[constru_id][:impacts][:er] += mat.calcWeight * mat_params["distance"].to_f * trans.er
        @results[constru_id][:impacts][:enr] += mat.calcWeight * mat_params["distance"].to_f * trans.enr
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
    respond_to do |format|
      if @construsolution.save
        if @construsolution.construtype == 0
          @construsolution.material_nv_ids.each do |mat|
            if mat != ""
              material = MaterialComposition.find(mat)
              jt = @construsolution.join_tables.new(material_composition: material)
              jt.construtype = 0
              jt.save
            end
          end
        else
          @construsolution.material_ext_ids.each do |mat|
            if mat != ""
              material = MaterialComposition.find(mat)
              jt = @construsolution.join_tables.new(material_composition: material)
              jt.construtype = 0
              jt.save
            end
          end
          @construsolution.material_int_ids.each do |mat|
            if mat != ""
              material = MaterialComposition.find(mat)
              jt = @construsolution.join_tables.new(material_composition: material)
              jt.construtype = 1
              jt.save
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
  
  end

  private
  def set_construsolution
    if params[:id]
      @construsolution = Construsolution.find(params[:id])
      @calcs = Hash.new
      @calcs[:rsi] = 0.13
      @calcs[:rse] = 0.04
      @calcs[:uNoDiv] = @calcs[:rse] + @calcs[:rsi]
      @calcs[:cost_c] = 0
      @calcs[:cost_m] = 0
      @calcs[:impacts] = @construsolution.calcImpacts
      if @construsolution.construtype == 0
        @calcs[:rsi] = 0.13
        @calcs[:rse] = 0.04
        @calcs[:uNoDiv] = @calcs[:rse] + @calcs[:rsi]
        @construsolution.material_compositions.each do |m|
          @calcs[:uNoDiv] += m.calcR
          @calcs[:cost_c] += m.construction_cost
          @calcs[:cost_m] += m.maintenance_cost
        end
        @calcs[:u] = (1 / @calcs[:uNoDiv]).round(4)
      else
        @calcs[:rsi] = 0.13
        @calcs[:rse] = 0.13
        @calcs[:uNoDiv] = @calcs[:rse] + @calcs[:rsi]
        @construsolution.join_tables.each do |m|
          material = MaterialComposition.find(m.material_composition_id)
          @calcs[:cost_c] += material.construction_cost
          @calcs[:cost_m] += material.maintenance_cost
          if m.construtype == 1
            @calcs[:uNoDiv] += material.calcR
          end
        end
        @calcs[:u] = (1 / @calcs[:uNoDiv]).round(4)
      end
    end
  end

    def construsolution_params
      params.require(:construsolution).permit(:name, :ref, :desc, :from, :adp, :impacts, :gwp, :odp, :ap, :pocp, :ep, :enr, :er, :construtype, :cimage,material_nv_ids:[], material_int_ids:[], material_ext_ids:[])
    end

    def compare_params
      params.require(:solutions_compare).permit(solutions_compare_ids:[])
    end

    def compare_params_results
      params.require(:solutions_compare_results).permit!
    end
end

