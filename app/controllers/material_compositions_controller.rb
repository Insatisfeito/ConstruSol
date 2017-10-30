class MaterialCompositionsController < ApplicationController
  before_action :set_material_composition, only: [:show, :edit, :update, :destroy]

  # GET /material_compositions
  # GET /material_compositions.json
  def index
    @material_compositions = MaterialComposition.all
    @material_compositions.each do |mat_comp|
      mat_comp.type_name = ['Material', "Alvenaria: Parede Simples","Alvenaria: Parede Dupla" ][mat_comp.mtype]
      mat_comp.weight_calc = 0
      mat_comp.width_calc = 0
      mat_comp.material_joins.each do |base_mat|
        mat_comp.weight_calc += base_mat.weight
        mat_comp.width_calc += base_mat.width
      end
    end
  end

  # GET /material_compositions/1
  # GET /material_compositions/1.json
  def show
    @material_composition.type_name = ['Material', "Alvenaria: Parede Simples","Alvenaria: Parede Dupla" ][@material_composition.mtype]
    @impacts = @material_composition.impacts
  end

  # GET /material_compositions/new
  def new
    @material_composition = MaterialComposition.new
  end

  # GET /material_compositions/1/edit
  def edit
  end

  def calcWeight
    @mat_weight = 0
    @material_composition.base_material.each do |m|
      @mat_weight += m.weight
    end
    @mat_weight
  end

  # POST /material_compositions
  # POST /material_compositions.json
  def create
    @material_composition = MaterialComposition.new(material_composition_params)
    @rp = material_composition_params
    respond_to do |format|
      if @material_composition.save
        if(@rp[:mtype] == "0")
          material = BaseMaterial.find(@rp[:material_composition_add])
          puts material.inspect
          mjt = @material_composition.material_joins.new(base_material: material)
          mjt[:weight] = @rp[:weight]
          mjt[:width] = @rp[:width]
          @material_composition[:lambda] = material.lambda
          mjt.save
          @material_composition.save
          
        elsif (@rp[:mtype] == "1")
          material = BaseMaterial.find(@rp[:material_composition_add])
          mjt = @material_composition.material_joins.new(base_material: material)
          mjt.weight = @rp[:weight_0]
          mjt.width = @rp[:width_0]
          @material_composition[:lambda] = @rp[:lambda_0]
          mjt.save
          @material_composition.save
        
        elsif (@rp[:mtype] == "2")
          material_1 = BaseMaterial.find(@rp[:material_composition_add_1])
          mjt1 = @material_composition.material_joins.new(base_material: material_1)
          mjt1.weight = @rp[:weight_1]
          mjt1.width = @rp[:width_1]
          mjt1.save
          material_2 = BaseMaterial.find(@rp[:material_composition_add_2])
          mjt2 = @material_composition.material_joins.new(base_material: material_2)
          mjt2.weight = @rp[:weight_2]
          mjt2.width = @rp[:width_2]
          @material_composition[:lambda] = @rp[:lambda_1]
          mjt2.save
          @material_composition.save
          

        else
          puts '------------FALHOU-------'
          puts @rp[:mtype]


        end
        format.html { redirect_to @material_composition, notice: 'Material composition was successfully created.' }
        format.json { render :show, status: :created, location: @material_composition }
      else
        format.html { render :new }
        format.json { render json: @material_composition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_compositions/1
  # PATCH/PUT /material_compositions/1.json
  def update
    respond_to do |format|
      if @material_composition.update(material_composition_params)
        format.html { redirect_to @material_composition, notice: 'Material composition was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_composition }
      else
        format.html { render :edit }
        format.json { render json: @material_composition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_compositions/1
  # DELETE /material_compositions/1.json
  def destroy
    @material_composition.destroy
    respond_to do |format|
      format.html { redirect_to material_compositions_url, notice: 'Material composition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_composition
      @material_composition = MaterialComposition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_composition_params
      params.require(:material_composition).permit(:description, :mtype, :construction_cost, :maintenance_cost, :material_composition_add, :width, :weight, :lambda, :material_composition_add_1, :width_1, :weight_1,
      :material_composition_add_2, :width_2, :weight_2, :width_0, :weight_0, :lambda_1, :lambda_0, :type_name, :weight_calc, :width_calc, :adp, :gwp, :odp, :ap, :pocp, :ep, :er, :enr, :impactsCalc)
    end
end
