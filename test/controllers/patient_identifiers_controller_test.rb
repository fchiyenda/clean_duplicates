require 'test_helper'

class PatientIdentifiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_identifier = patient_identifiers(:one)
  end

  test "should get index" do
    get patient_identifiers_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_identifier_url
    assert_response :success
  end

  test "should create patient_identifier" do
    assert_difference('PatientIdentifier.count') do
      post patient_identifiers_url, params: { patient_identifier: { creator: @patient_identifier.creator, date_created: @patient_identifier.date_created, date_voided: @patient_identifier.date_voided, identifier: @patient_identifier.identifier, identifier_type: @patient_identifier.identifier_type, location_id: @patient_identifier.location_id, patient_id: @patient_identifier.patient_id, patient_identifier_id: @patient_identifier.patient_identifier_id, preferred: @patient_identifier.preferred, uuid: @patient_identifier.uuid, void_reason: @patient_identifier.void_reason, voided: @patient_identifier.voided, voided_by: @patient_identifier.voided_by } }
    end

    assert_redirected_to patient_identifier_url(PatientIdentifier.last)
  end

  test "should show patient_identifier" do
    get patient_identifier_url(@patient_identifier)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_identifier_url(@patient_identifier)
    assert_response :success
  end

  test "should update patient_identifier" do
    patch patient_identifier_url(@patient_identifier), params: { patient_identifier: { creator: @patient_identifier.creator, date_created: @patient_identifier.date_created, date_voided: @patient_identifier.date_voided, identifier: @patient_identifier.identifier, identifier_type: @patient_identifier.identifier_type, location_id: @patient_identifier.location_id, patient_id: @patient_identifier.patient_id, patient_identifier_id: @patient_identifier.patient_identifier_id, preferred: @patient_identifier.preferred, uuid: @patient_identifier.uuid, void_reason: @patient_identifier.void_reason, voided: @patient_identifier.voided, voided_by: @patient_identifier.voided_by } }
    assert_redirected_to patient_identifier_url(@patient_identifier)
  end

  test "should destroy patient_identifier" do
    assert_difference('PatientIdentifier.count', -1) do
      delete patient_identifier_url(@patient_identifier)
    end

    assert_redirected_to patient_identifiers_url
  end
end
