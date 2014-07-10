class ApplicationController < ActionController::Base
  include ActionView::Helpers::NumberHelper
  require 'pry'

  protect_from_forgery
end
