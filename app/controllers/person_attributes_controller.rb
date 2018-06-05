class PersonAttributesController < ApplicationController
  before_action :set_person_attribute, only: [:show, :edit, :update, :destroy]

  # GET /person_attributes
  # GET /person_attributes.json
  def index
    @person_attributes = PersonAttribute.all
  end

  # GET /person_attributes/1
  # GET /person_attributes/1.json
  def show
  end

  # GET /person_attributes/new
  def new
    @person_attribute = PersonAttribute.new
  end

  # GET /person_attributes/1/edit
  def edit
  end

  # POST /person_attributes
  # POST /person_attributes.json
  def create
    @person_attribute = PersonAttribute.new(person_attribute_params)

    respond_to do |format|
      if @person_attribute.save
        format.html { redirect_to @person_attribute, notice: 'Person attribute was successfully created.' }
        format.json { render :show, status: :created, location: @person_attribute }
      else
        format.html { render :new }
        format.json { render json: @person_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_attributes/1
  # PATCH/PUT /person_attributes/1.json
  def update
    respond_to do |format|
      if @person_attribute.update(person_attribute_params)
        format.html { redirect_to @person_attribute, notice: 'Person attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_attribute }
      else
        format.html { render :edit }
        format.json { render json: @person_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_attributes/1
  # DELETE /person_attributes/1.json
  def destroy
    @person_attribute.destroy
    respond_to do |format|
      format.html { redirect_to person_attributes_url, notice: 'Person attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_attribute
      @person_attribute = PersonAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_attribute_params
      params.require(:person_attribute).permit(:person_attribute_id, :person_id, :value, :person_attribute_type_id, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :voided_reason, :uuid)
    end
end
