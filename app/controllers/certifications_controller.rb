class CertificationsController < InheritedResources::Base
  load_and_authorize_resource

  private

    def certification_params
      params.require(:certification).permit(:name, :category, :post_nominal, skill_ids: [])
    end
end

