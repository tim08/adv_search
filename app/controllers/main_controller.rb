class MainController < ApplicationController

  def index
    @companies = Company.all
    # Company.search(params)
  end

  def important_article

  end

  def articles

  end


end
