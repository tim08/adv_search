class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_out_path_for(resource_or_scope)
    companies_path
  end
end
