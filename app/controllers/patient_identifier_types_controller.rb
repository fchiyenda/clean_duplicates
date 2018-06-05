class PatientIdentifierTypesController < ApplicationController
  before_action :set_patient_identifier_type, only: [:show, :edit, :update, :destroy]

  # GET /patient_identifier_types
  # GET /patient_identifier_types.json
  def index
    @patient_identifier_types = PatientIdentifierType.all
  end

  # GET /patient_identifier_types/1
  # GET /patient_identifier_types/1.json
  def show
  end

  # GET /patient_identifier_types/new
  def new
    @patient_identifier_type = PatientIdentifierType.new
  end

  # GET /patient_identifier_types/1/edit
  def edit
  end

  # POST /patient_identifier_types
  # POST /patient_identifier_types.json
  def create
    @patient_identifier_type = PatientIdentifierType.new(patient_identifier_type_params)

    respond_to do |format|
      if @patient_identifier_type.save
        format.html { redirect_to @patient_identifier_type, notice: 'Patient identifier type was successfully created.' }
        format.json { render :show, status: :created, location: @patient_identifier_type }
      else
        format.html { render :new }
        format.json { render json: @patient_identifier_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_identifier_types/1
  # PATCH/PUT /patient_identifier_types/1.json
  def update
    respond_to do |format|
      if @patient_identifier_type.update(patient_identifier_type_params)
        format.html { redirect_to @patient_identifier_type, notice: 'Patient identifier type was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_identifier_type }
      else
        format.html { render :edit }
        format.json { render json: @patient_identifier_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_identifier_types/1
  # DELETE /patient_identifier_types/1.json
  def destroy
    @patient_identifier_type.destroy
    respond_to do |format|
      format.html { redirect_to patient_identifier_types_url, notice: 'Patient identifier type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_identifier_type
      @patient_identifier_type = PatientIdentifierType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_identifier_type_params
      params.require(:patient_identifier_type).permit(:patient_identifier_type_id, :name, :description, :format, :check_digit, :creator, :date_created, :required, :format_description, :validator, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
