class JobProgramsController < ApplicationController
    load_and_authorize_resource
    inherit_resources

    def index
        @job_types_by_id = {};
        @job_skills_by_id = {};
        @job_programs.each do |program|
            @job_types_by_id[program.id] = program.job_types
            @jobs = program.job_types
            @jobs.each do |job_types|
                @job_skills_by_id[program.id] = job_types.skills
            end
        end
    end
end
