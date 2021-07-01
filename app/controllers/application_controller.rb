class ApplicationController < ActionController::Base
  before_action :first_time_visit, unless: -> { cookies[:first_visit] }
  before_action :set_session_time, unless: -> { session[:created_at] }
  before_action :set_created_submissions

  private

  def first_time_visit
    cookies.permanent[:first_visit] = 1
    redirect_to root_path
  end

  def set_session_time
    session[:created_at] = Time.current 
  end

  def set_created_submissions
    @session_submissions = Submission.where("created_at > ?", session[:created_at])
  end
end
