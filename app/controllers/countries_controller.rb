class CountriesController < ApplicationController
  before_action :set_country, only: %i[ show edit update destroy ]

  # GET /countries or /countries.json
  def index
    @countries = Country.order(:rank)
  end
  
  # GET /countries/1 or /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries or /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to country_url(@country), notice: "Country was successfully created." }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1 or /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to country_url(@country), notice: "Country was successfully updated." }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1 or /countries/1.json
  def destroy
    @country.destroy

    respond_to do |format|
      format.html { redirect_to countries_url, notice: "Country was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_ranks
    ActiveRecord::Base.transaction do
      params[:country_ids].each_with_index do |id, index|
        country = Country.find(id)
        country.update(rank: index + 1)
      end
    end
    head :ok
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def toggle_been
    country = Country.find(params[:id])
    country.update(been: params[:been])
  
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  def data
    countries = Country.all
    render json: countries.map { |c| { code: c.code, been: c.been } } # Adjust the mapping as per your model
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:name, :rank, :been, :code)  
    end


     

end
