class CertificationsController < InheritedResources::Base

  private

    def certification_params
      params.require(:certification).permit(:name, :category, :post_nominal)
    end
end

