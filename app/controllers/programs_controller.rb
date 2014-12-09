class ProgramsController < ApplicationController
    load_and_authorize_resource
    inherit_resources

    def index
        @job_types_by_id = {};
        @programs.each do |program|
            @job_types_by_id[program.id] = program.job_types
        end
    end
end
