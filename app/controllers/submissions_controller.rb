class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submissions_params)
    redirect_to "/#{submissions_params[:text]}"
  end

  private

  def submissions_params
    params.require(:submission).permit(:text)
  end
end