class MaterialsController < InheritedResources::Base
  private

    def material_params
      params.require(:material).permit(:name, :e, :lambda, :adp, :gwp, :odp, :ap, :popc, :ep, :enr, :er, :weight, :cost, :brick, :brick_height, :brick_width, :brick_depth, :brick_count_meter_square)
    end
end

