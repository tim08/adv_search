class MainController < ApplicationController

  def index
    @companies = Company.search(params)
    @companies_news = Company.verified.last(3)
  end

  def important_article

  end

  def main_articles

  end

  def agreement

  end

  def adv_agency
    @company = Company.find(params[:id])
  end


end
