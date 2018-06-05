require 'test_helper'

class PatientIdentifierTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_identifier_type = patient_identifier_types(:one)
  end

  test "should get index" do
    get patient_identifier_types_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_identifier_type_url
    assert_response :success
  end

  test "should create patient_identifier_type" do
    assert_difference('PatientIdentifierType.count') do
      post patient_identifier_types_url, params: { patient_identifier_type: { check_digit: @patient_identifier_type.check_digit, creator: @patient_identifier_type.creator, date_created: @patient_identifier_type.date_created, date_retired: @patient_identifier_type.date_retired, description: @patient_identifier_type.description, format: @patient_identifier_type.format, format_description: @patient_identifier_type.format_description, name: @patient_identifier_type.name, patient_identifier_type_id: @patient_identifier_type.patient_identifier_type_id, required: @patient_identifier_type.required, retire_reason: @patient_identifier_type.retire_reason, retired: @patient_identifier_type.retired, retired_by: @patient_identifier_type.retired_by, uuid: @patient_identifier_type.uuid, validator: @patient_identifier_type.validator } }
    end

    assert_redirected_to patient_identifier_type_url(PatientIdentifierType.last)
  end

  test "should show patient_identifier_type" do
    get patient_identifier_type_url(@patient_identifier_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_identifier_type_url(@patient_identifier_type)
    assert_response :success
  end

  test "should update patient_identifier_type" do
    patch patient_identifier_type_url(@patient_identifier_type), params: { patient_identifier_type: { check_digit: @patient_identifier_type.check_digit, creator: @patient_identifier_type.creator, date_created: @patient_identifier_type.date_created, date_retired: @patient_identifier_type.date_retired, description: @patient_identifier_type.description, format: @patient_identifier_type.format, format_description: @patient_identifier_type.format_description, name: @patient_identifier_type.name, patient_identifier_type_id: @patient_identifier_type.patient_identifier_type_id, required: @patient_identifier_type.required, retire_reason: @patient_identifier_type.retire_reason, retired: @patient_identifier_type.retired, retired_by: @patient_identifier_type.retired_by, uuid: @patient_identifier_type.uuid, validator: @patient_identifier_type.validator } }
    assert_redirected_to patient_identifier_type_url(@patient_identifier_type)
  end

  test "should destroy patient_identifier_type" do
    assert_difference('PatientIdentifierType.count', -1) do
      delete patient_identifier_type_url(@patient_identifier_type)
    end

    assert_redirected_to patient_identifier_types_url
  end
end
