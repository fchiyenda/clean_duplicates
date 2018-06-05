json.extract! person, :id, :person_id, :gender, :birthdate, :birthdate_estimated, :dead, :death_date, :cause_of_death, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :created_at, :updated_at
json.url person_url(person, format: :json)
