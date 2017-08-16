ActiveAdmin.register Material do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :e, :lambda, :adp, :gwp, :odp, :ap, :popc, :ep, :enr, :er, :weight, :cost, :brick, :brick_height, :brick_width, :brick_depth, :brick_count_meter_square
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end

