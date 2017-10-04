class MainController < ApplicationController

  def index
    @companies = Company.search(params)
    @projects_news = Company.news_projects
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
