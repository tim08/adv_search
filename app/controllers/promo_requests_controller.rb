class PromoRequestsController < ApplicationController
  before_action :set_promo_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:new, :create]
  layout 'admins', except: [:new, :create]

  # GET /promo_requests
  # GET /promo_requests.json
  def index
    @promo_requests = PromoRequest.order(created_at: :desc)
  end

  # GET /promo_requests/1
  # GET /promo_requests/1.json
  def show
  end

  # GET /promo_requests/new
  def new
    @promo_request = PromoRequest.new
  end

  # GET /promo_requests/1/edit
  def edit
  end

  # POST /promo_requests
  # POST /promo_requests.json
  def create
    @promo_request = PromoRequest.new(promo_request_params)

    respond_to do |format|
      if @promo_request.save
        format.html { redirect_to root_path, notice: 'Ваша заявка успешно отправлена. Она будет рассмотрена в ближайшее время. Спасибо.' }
        format.json { render :show, status: :created, location: @promo_request }
      else
        format.html { render :new }
        format.json { render json: @promo_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promo_requests/1
  # PATCH/PUT /promo_requests/1.json
  def update
    respond_to do |format|
      if @promo_request.update(promo_request_params)
        format.html { redirect_to @promo_request, notice: 'Promo request was successfully updated.' }
        format.json { render :show, status: :ok, location: @promo_request }
      else
        format.html { render :edit }
        format.json { render json: @promo_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promo_requests/1
  # DELETE /promo_requests/1.json
  def destroy
    @promo_request.destroy
    respond_to do |format|
      format.html { redirect_to promo_requests_url, notice: 'Promo request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo_request
      @promo_request = PromoRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promo_request_params
      params.require(:promo_request).permit(:name, :min_order_price, :description, :contact_details, :adv_type, :contact_email, :city_id, :verified_at)
    end
end
