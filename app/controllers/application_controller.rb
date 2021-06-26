class ApplicationController < ActionController::Base
  before_action :first_time_visit, unless: -> { cookies[:first_visit] }

  private

  def first_time_visit
    cookies.permanent[:first_visit] = 1
    redirect_to root_path
  end
end
