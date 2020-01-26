class MainController < ApplicationController

  def index
    @companies = Company.search(params)
    @premium_companies = Company.premium.last(3).reverse
    @projects_news = Company.news_projects
    @reviews = Company.reviews_main
    @articles = Article.verified.last(3)
    @last_promo_requests = PromoRequest.verified.order(created_at: :desc).limit(3)
    @custom_description = CustomDescription.all
    @promo_requests_sum = PromoRequest.sum(:min_order_price)
  end

  def important_article
    @articles_sample = Article.order("RAND()").first(3)
  end

  def main_articles
    @articles = Article.verified.order(created_at: :desc)
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
    @promo_requests = PromoRequest.verified.non_closed.search(params).page(params[:page])
  end


end
