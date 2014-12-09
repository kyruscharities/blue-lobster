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
        if @job_program.publish!
            redirect_to :back, notice: "Published #{@job_program.name}"
        else
            redirect_to :back, alert: "Failed to publish #{@job_program.name}. Please call Brian."
        end
    end

    def unpublish
        if @job_program.unpublish!
            redirect_to :back, notice: "Unpublished #{@job_program.name}"
        else
            redirect_to :back, alert: "Failed to unpublish #{@job_program.name}. Please call Brian."
        end
    end

    private

    def job_program_params
        params.require(:job_program).permit(:name, :description, :published)
    end

end
