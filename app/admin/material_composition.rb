ActiveAdmin.register MaterialComposition do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :adp, :gwp, :odp, :ap, :pocp, :impactsCalc, :ep, :er, :enr, :material_composition_add_0, :material_composition_add, :material_composition_add, :width, :weight, :lambda, :material_composition_add_1, :width_1, :weight_1, :width_0, :weight_0, :lambda_0, :type_name, :weight_calc, :width_calc, :lambda_1 , :material_composition_add_2, :width_2, :weight_2
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
