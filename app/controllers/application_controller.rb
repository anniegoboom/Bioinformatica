class ApplicationController < ActionController::Base
  include ActionView::Helpers::NumberHelper

  before_filter :authenticate_user!

  protect_from_forgery
end
