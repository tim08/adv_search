class MainController < ApplicationController

  def index
    @companies = Company.search(params)
    @projects_news = Company.news_projects
    @reviews = Company.reviews_main
    @articles = Article.last(3)
    @last_promo_requests = PromoRequest.verified.last(3)
  end

  def important_article; end

  def main_articles
    @articles = Article.all
  end

  def main_article
    @article = Article.find(params[:id])
  end

  def agreement; end

  def adv_agency
    @company = Company.find(params[:id])
    @review = @company.reviews.new
  end

  def main_promo_requests
    @promo_requests = PromoRequest.verified
  end


end
