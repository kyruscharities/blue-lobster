class MilitaryJobCodesController < InheritedResources::Base

  private

    def military_job_code_params
      params.require(:military_job_code).permit(:service, :mpc, :status, :code, :title, :onetcode, :onettitle)
    end
end

