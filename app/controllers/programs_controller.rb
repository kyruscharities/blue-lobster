class ProgramsController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  skip_authorize_resource only: :edit
  skip_authorization_check only: :edit

  def publish
    if @program.publish!
      redirect_to :back, notice: "Published #{@program.name}"
    else
      redirect_to :back, alert: "Failed to publish #{@program.name}"
    end
  end

  def unpublish
    if @program.unpublish!
      redirect_to :back, notice: "Unpublished #{@program.name}"
    else
      redirect_to :back, alert: "Failed to unpublish #{@program.name}"
    end
  end

  private

  def program_params
    params.require(:program).permit(:name, :description, :published, job_type_ids: [])
  end

end
