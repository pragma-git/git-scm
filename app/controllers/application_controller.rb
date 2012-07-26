PageNotFound = Class.new(Exception)

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :determine_os

  layout 'layout'

  rescue_from PageNotFound, :with => :page_not_found

  # Mac, Windows, Linux are valid
  def determine_os
    @os = 'linux'
  end

  private

  def page_not_found
    render :file => not_found_template, :layout => false
  end

  def not_found_template
    File.join(Rails.root, "public/404.html")
  end

end
