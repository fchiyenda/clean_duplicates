class GlobalPropertiesController < ApplicationController
  before_action :set_global_property, only: [:show, :edit, :update, :destroy]

  # GET /global_properties
  # GET /global_properties.json
  def index
    @global_properties = GlobalProperty.all
  end

  # GET /global_properties/1
  # GET /global_properties/1.json
  def show
  end

  # GET /global_properties/new
  def new
    @global_property = GlobalProperty.new
  end

  # GET /global_properties/1/edit
  def edit
  end

  # POST /global_properties
  # POST /global_properties.json
  def create
    @global_property = GlobalProperty.new(global_property_params)

    respond_to do |format|
      if @global_property.save
        format.html { redirect_to @global_property, notice: 'Global property was successfully created.' }
        format.json { render :show, status: :created, location: @global_property }
      else
        format.html { render :new }
        format.json { render json: @global_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /global_properties/1
  # PATCH/PUT /global_properties/1.json
  def update
    respond_to do |format|
      if @global_property.update(global_property_params)
        format.html { redirect_to @global_property, notice: 'Global property was successfully updated.' }
        format.json { render :show, status: :ok, location: @global_property }
      else
        format.html { render :edit }
        format.json { render json: @global_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /global_properties/1
  # DELETE /global_properties/1.json
  def destroy
    @global_property.destroy
    respond_to do |format|
      format.html { redirect_to global_properties_url, notice: 'Global property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_property
      @global_property = GlobalProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def global_property_params
      params.require(:global_property).permit(:property, :property_value, :description, :uuid)
    end
end
