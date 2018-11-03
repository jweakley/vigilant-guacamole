class ApplicationController < ActionController::API
  force_ssl if Rails.env.production?
end
