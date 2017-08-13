class MainController < ApplicationController

  def index
    @companies = Company.all
    # Company.search(params)
  end



end
