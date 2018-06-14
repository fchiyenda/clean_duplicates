class PatientIdentifiersController < ApplicationController
  before_action :set_patient_identifier, only: [:show, :edit, :update, :destroy]

  # GET /patient_identifiers
  # GET /patient_identifiers.json
  def index
    @patient_identifiers = PatientIdentifier.all
  end

  # GET /patient_identifiers/1  # GET /patient_identifiers/1.json
  def show
  end

  # GET /patient_identifiers/new
  def new
    @patient_identifier = PatientIdentifier.new
  end

  # GET /patient_identifiers/1/edit
  def edit
  end

  # POST /patient_identifiers
  # POST /patient_identifiers.json
  def create
    @patient_identifier = PatientIdentifier.new(patient_identifier_params)

    respond_to do |format|
      if @patient_identifier.save
        format.html { redirect_to @patient_identifier, notice: 'Patient identifier was successfully created.' }
        format.json { render :show, status: :created, location: @patient_identifier }
      else
        format.html { render :new }
        format.json { render json: @patient_identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_identifiers/1
  # PATCH/PUT /patient_identifiers/1.json
  def update
    respond_to do |format|
      if @patient_identifier.update(patient_identifier_params)
        format.html { redirect_to @patient_identifier, notice: 'Patient identifier was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_identifier }
      else
        format.html { render :edit }
        format.json { render json: @patient_identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_identifiers/1
  # DELETE /patient_identifiers/1.json
  def destroy
    @patient_identifier.destroy
    respond_to do |format|
      format.html { redirect_to patient_identifiers_url, notice: 'Patient identifier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_identifier
      @patient_identifier = PatientIdentifier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_identifier_params
      params.require(:patient_identifier).permit(:patient_identifier_id, :patient_id, :identifier, :identifier_type, :preferred, :location_id, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid)
    end
end
