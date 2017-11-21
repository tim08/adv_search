class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy help promo_requests accept_promo_request]
  before_action :authenticate_company!

  # GET /companies
  # GET /companies.json
  def index
    @company = current_company
  end

  # GET /companies/1
  # GET /companies/1.json
  def show; end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit; end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to action: :index, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def help; end

  def promo_requests
    @free_promo_requests = PromoRequest.search_free(@company)
    @processing_promo_requests = @company.promo_requests
  end

  def accept_promo_request
    @promo_request = PromoRequest.find(params[:promo_request_id])
    @promo_request.update! status: :processing, company_id: @company.id
    respond_to do |format|
      format.html {redirect_to promo_requests_company_path, notice: 'Заявка взята в обработку'}
      format.json {head :no_content}
    end
  end

  def close_promo_request
    @promo_request = PromoRequest.find(params[:promo_request_id])
    @promo_request.update! status: :closed
    respond_to do |format|
      format.html {redirect_to promo_requests_company_path, notice: 'Заявка закрыта'}
      format.json {head :no_content}
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:name, :promo, :direct_mail, :outdoor_ads, :radio_ads, :design_services,
                                    :product_placement, :marketing_research, :install_adv_constructions,
                                    :production_promotional_materials, :print_services, :salepoint_ads, :internet_ids,
                                    :tv_ads, :mass_media, :indoor_ads, :transport_ads, :min_order_price, :description,
                                    :common_exp, :phone_contact, :address_contact, :email_contact, :slogan, :logo, :expiration_date_of_premium,
                                    city_ids: [])
  end
end
