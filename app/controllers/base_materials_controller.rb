class BaseMaterialsController < ApplicationController
  before_action :set_base_material, only: [:show]

  # GET /base_materials
  # GET /base_materials.json
  def index
    @base_materials = BaseMaterial.all
  end

  # GET /base_materials/1
  # GET /base_materials/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_material
      @base_material = BaseMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def base_material_params
      params.require(:base_material).permit(:description, :adp, :gwp, :odp, :ap, :pocp, :ep, :enr, :er, :lambda)
    end
end
