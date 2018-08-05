class CustomDescriptionsController < ApplicationController
  before_action :set_custom_description, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'admins'

  # GET /custom_descriptions
  # GET /custom_descriptions.json
  def index
    @custom_descriptions = CustomDescription.all
  end

  # GET /custom_descriptions/1
  # GET /custom_descriptions/1.json
  def show
  end

  # GET /custom_descriptions/new
  def new
    @custom_description = CustomDescription.new
  end

  # GET /custom_descriptions/1/edit
  def edit
  end

  # POST /custom_descriptions
  # POST /custom_descriptions.json
  def create
    @custom_description = CustomDescription.new(custom_description_params)

    respond_to do |format|
      if @custom_description.save
        format.html { redirect_to @custom_description, notice: 'Custom description was successfully created.' }
        format.json { render :show, status: :created, location: @custom_description }
      else
        format.html { render :new }
        format.json { render json: @custom_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_descriptions/1
  # PATCH/PUT /custom_descriptions/1.json
  def update
    respond_to do |format|
      if @custom_description.update(custom_description_params)
        format.html { redirect_to @custom_description, notice: 'Custom description was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_description }
      else
        format.html { render :edit }
        format.json { render json: @custom_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_descriptions/1
  # DELETE /custom_descriptions/1.json
  def destroy
    @custom_description.destroy
    respond_to do |format|
      format.html { redirect_to custom_descriptions_url, notice: 'Custom description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_description
      @custom_description = CustomDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_description_params
      params.require(:custom_description).permit(:name, :body)
    end
end
