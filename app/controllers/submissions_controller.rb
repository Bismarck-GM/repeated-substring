class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    sanitized_text = sanitize_text_params(submissions_params[:text])
    @submission = Submission.create(text: sanitized_text)
    redirect_to "/#{sanitized_text}"
  end

  def show
    @submission = Submission.new
    @current_submission = Submission.where(text: show_params).last
    redirect_to root_path if @current_submission.nil?
  end

  def reset_session
    session[:created_at] = nil
    redirect_to root_path
  end

  private

  def submissions_params
    params.require(:submission).permit(:text)
  end

  def show_params
    params.require(:path)
  end

  def sanitize_text_params(string)
    new_text = string.downcase
    new_text.gsub(/[^a-z0-9]/, '')
  end

end