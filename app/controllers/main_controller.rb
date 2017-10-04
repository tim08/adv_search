class MainController < ApplicationController

  def index
    @companies = Company.search(params)
    @projects_news = Company.news_projects
    @reviews = Company.reviews_main
  end

  def important_article

  end

  def main_articles

  end

  def agreement

  end

  def adv_agency
    @company = Company.find(params[:id])
    @review = @company.reviews.new
  end


end
