json.extract! patient_identifier, :id, :patient_identifier_id, :patient_id, :identifier, :identifier_type, :preferred, :location_id, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :created_at, :updated_at
json.url patient_identifier_url(patient_identifier, format: :json)
