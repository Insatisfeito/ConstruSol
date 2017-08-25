class TransportsController < InheritedResources::Base
  private

    def transport_params
      params.require(:transport).permit(:name, :simapro_name, :adp, :gwp, :odp, :ap, :popc, :ep, :enr, :er)
    end
end

