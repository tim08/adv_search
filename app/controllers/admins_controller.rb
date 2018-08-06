class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  def companies
    @companies = Company.all.order(created_at: :desc)
  end

  def reviews
    @reviews = Review.all.order(created_at: :desc)
  end

  def change_company_status
    @company = Company.find(params[:id])
    @company.update_column(:verified, !@company.verified)
    respond_to do |format|
      format.html {redirect_to companies_admins_path, notice: 'Company status changed'}
      format.json {head :no_content}
    end
  end

  def change_request_status
    @promo_request = PromoRequest.find(params[:id])
    @promo_request.update! status: :free, verified_at: DateTime.now
    NotificationMailer.with(promo_request: @promo_request).notification_new_promo_request.deliver_later
    respond_to do |format|
      format.html {redirect_to promo_requests_path, notice: 'Request status changed'}
      format.json {head :no_content}
    end
  end

  def change_review_status
    @review = Review.find(params[:id])
    @review.update_column(:verified, !@review.verified)
    respond_to do |format|
      format.html {redirect_to reviews_admins_path, notice: 'Review status changed'}
      format.json {head :no_content}
    end
  end

  def change_article_status
    @article = Article.find(params[:id])
    @article.update_column(:verified, !@article.verified)
    respond_to do |format|
      format.html {redirect_to articles_path, notice: 'Article status changed'}
      format.json {head :no_content}
    end
  end

  def delete_company
    @company = Company.find(params[:id])
    @company.destroy
    respond_to do |format|
      format.html {redirect_to companies_admins_path, notice: 'Company destroyed'}
      format.json {head :no_content}
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html {redirect_to @admin, notice: 'Admin was successfully created.'}
        format.json {render :show, status: :created, location: @admin}
      else
        format.html {render :new}
        format.json {render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html {redirect_to @admin, notice: 'Admin was successfully updated.'}
        format.json {render :show, status: :ok, location: @admin}
      else
        format.html {render :edit}
        format.json {render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html {redirect_to admins_url, notice: 'Admin was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.fetch(:admin, {})
  end
end
