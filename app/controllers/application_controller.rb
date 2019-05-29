# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Concerns::ErrorHandler

  protect_from_forgery
end