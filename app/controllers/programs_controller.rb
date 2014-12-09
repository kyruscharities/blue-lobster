class ProgramsController < ApplicationController
    load_and_authorize_resource
    inherit_resources

    def index
        @job_types_by_id = {};
        @programs.each do |program|
            @job_types_by_id[program.id] = program.job_types
        end
    end

    def publish
        if @program.publish!
            redirect_to :back, notice: "Published #{@program.name}"
        else
            redirect_to :back, alert: "Failed to publish #{@program.name}. Please call Brian."
        end
    end

    def unpublish
        if @program.unpublish!
            redirect_to :back, notice: "Unpublished #{@program.name}"
        else
            redirect_to :back, alert: "Failed to unpublish #{@program.name}. Please call Brian."
        end
    end

    private

    def program_params
        params.require(:program).permit(:name, :description, :published, job_type_ids: [])
    end

end
