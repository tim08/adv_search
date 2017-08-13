class MainController < ApplicationController
  layout 'progressus'

  def index
    @companies = Company.all
    # Company.search(params)
  end



end
