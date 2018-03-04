class MainController < ApplicationController

  def index
    @companies = Company.search(params)
    @premium_companies = Company.premium.last(3)
    @projects_news = Company.news_projects
    @reviews = Company.reviews_main
    @articles = Article.last(3)
    @last_promo_requests = PromoRequest.verified.last(3)
  end

  def important_article
    @articles_sample = Article.order("RAND()").first(3)
  end

  def main_articles
    @articles = Article.all
  end

  def main_article
    @article = Article.find(params[:id])
    @articles_sample = Article.order("RAND()").first(3)
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
