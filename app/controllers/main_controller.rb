class MainController < ApplicationController

  def index
    @companies = Company.all
    # Company.search(params)
  end

  def important_article

  end

  def main_articles

  end

  def agreement

  end


end
