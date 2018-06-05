class PersonAttributeTypesController < ApplicationController
  before_action :set_person_attribute_type, only: [:show, :edit, :update, :destroy]

  # GET /person_attribute_types
  # GET /person_attribute_types.json
  def index
    @person_attribute_types = PersonAttributeType.all
  end

  # GET /person_attribute_types/1
  # GET /person_attribute_types/1.json
  def show
  end

  # GET /person_attribute_types/new
  def new
    @person_attribute_type = PersonAttributeType.new
  end

  # GET /person_attribute_types/1/edit
  def edit
  end

  # POST /person_attribute_types
  # POST /person_attribute_types.json
  def create
    @person_attribute_type = PersonAttributeType.new(person_attribute_type_params)

    respond_to do |format|
      if @person_attribute_type.save
        format.html { redirect_to @person_attribute_type, notice: 'Person attribute type was successfully created.' }
        format.json { render :show, status: :created, location: @person_attribute_type }
      else
        format.html { render :new }
        format.json { render json: @person_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_attribute_types/1
  # PATCH/PUT /person_attribute_types/1.json
  def update
    respond_to do |format|
      if @person_attribute_type.update(person_attribute_type_params)
        format.html { redirect_to @person_attribute_type, notice: 'Person attribute type was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_attribute_type }
      else
        format.html { render :edit }
        format.json { render json: @person_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_attribute_types/1
  # DELETE /person_attribute_types/1.json
  def destroy
    @person_attribute_type.destroy
    respond_to do |format|
      format.html { redirect_to person_attribute_types_url, notice: 'Person attribute type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_attribute_type
      @person_attribute_type = PersonAttributeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_attribute_type_params
      params.require(:person_attribute_type).permit(:person_attribute_type_id, :name, :description, :format, :foreign_key, :searchable, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :edit_privilege, :uuid, :sort_weight)
    end
end
