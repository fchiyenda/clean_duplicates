require 'damerau-levenshtein'
require 'date'

def get_source_data
	source_data = ActiveRecord::Base.connection.select_all <<EOF
		SELECT pi.patient_id,pi.identifier npid,identifier_type,
                      (SELECT group_concat(pi2.identifier) legacy
                      FROM openmrs_ngoni.patient_identifier pi2
                      WHERE pi2.identifier_type = 2
                      AND pi.patient_id = pi2.patient_id
                      GROUP BY patient_id) legacy_ids,
                      pi.date_created,given_name,middle_name,family_name,gender,birthdate,birthdate_estimated,death_date,pa.*
                      FROM openmrs_ngoni.patient_identifier pi
                      JOIN openmrs_ngoni.person p
                      ON pi.patient_id = p.person_id
                      JOIN openmrs_ngoni.person_name pn
                      ON pi.patient_id = pn.person_id
                      LEFT JOIN openmrs_ngoni.person_address pa
                      ON pi.patient_id = pa.person_id
                      where pi.voided = 0 and identifier_type = 3
                      group by pi.patient_id,pi.identifier;
EOF

  return source_data
end

def scenario1(person)
  potential_duplicates = []
  $comparision_data.each do |p|
  	 	next if person['patient_id'] == p['patient_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 &&
  	   DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 &&
  	   person['gender'] == p['gender'] && 
  	   person['birthdate'] == p['birthdate'] && 
  	   person['birthdate_estimated'] == p['birthdate_estimated'] && 
  	   DamerauLevenshtein.distance("#{person['home_village']}","#{p['home_village']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario2(person)
  potential_duplicates = []
  $comparision_data.each do |p|
  	next if person['patient_id'] == p['patient_id']
  	if (DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2) &&    (DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2) && (person['gender'] == p['gender']) && 
  		(person['birthdate'] == p['birthdate'])

      potential_duplicates << p
    end
  end
  return potential_duplicates
end

def scenario3(person)
	potential_duplicates = []
  $comparision_data.each do |p|
  	next if person['patient_id'] == p['patient_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['gender'] == p['gender'] \
  		 && (person['birthdate'].year - p['birthdate'].year).abs <= 2 \
  		 && person['birthdate_estimated'] == p['birthdate_estimated'] \
  		 && DamerauLevenshtein.distance("#{person['home_village']}","#{p['home_village']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario4(person)
	potential_duplicates = []
  $comparision_data.each do |p|
  	next if person['patient_id'] == p['patient_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['birthdate'] == p['birthdate'] \
  		 && person['birthdate_estimated'] == p['birthdate_estimated'] \
  		 && DamerauLevenshtein.distance("#{person['home_village']}","#{p['home_village']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario5(person)
	potential_duplicates = []
  $comparision_data.each do |p|
  	next if person['patient_id'] == p['patient_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['gender'] == p['gender'] \
  		 && (person['birthdate'].year - p['birthdate'].year).abs <= 2 \
  		 && person['birthdate_estimated'] == p['birthdate_estimated']

       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario6(person)
	potential_duplicates = []
  $comparision_data.each do |p|
  	next if person['patient_id'] == p['patient_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['birthdate'] == p['birthdate'] \
  		 && person['birthdate_estimated'] == p['birthdate_estimated']
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario7(person)
	potential_duplicates = []
  $comparision_data.each do |p|
  	next if person['patient_id'] == p['patient_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def display_conflicts(people_data,person)
	people_data.each do |p|
					puts "patient_id: #{person['patient_id']},npid: #{person['npid']}," \
					     "given name: #{person['given_name']},Family Name: #{person['family_name']}, " \
					     " gender: #{person['gender']},DOB: #{person['birthdate']}" \
					     "DOB_est: #{person['birthdate_estimated']},Home Village: #{person['home_village']}"
					puts "patient_id: #{p['patient_id']},npid: #{p['npid']}," \
					     "given name: #{p['given_name']}, Family Name: #{p['family_name']}, " \
					     " gender: #{p['gender']},DOB: #{p['birthdate']}" \
					     "DOB_est: #{p['birthdate_estimated']},Home Village: #{p['home_village']}"
					response = gets.chomp
			end
end

def check_against_scenario
	puts "Getting data from source"
	people = get_source_data
	$comparision_data = get_source_data

	people.each do |person|
		puts "Checking #{person['npid']}"
		puts "Checking Scenario1"
		conflicts = scenario1(person)
		display_conflicts(conflicts,person) if conflicts.count > 0	
		puts "Checking Scenario2"
		conflicts = scenario2(person)	
		display_conflicts(conflicts,person) if conflicts.count > 0
		puts "Checking Scenario3"
		conflicts = scenario3(person)
		display_conflicts(conflicts,person) if conflicts.count > 0
		puts "Checking Scenario4"
		conflicts = scenario4(person)
		display_conflicts(conflicts,person) if conflicts.count > 0	
		puts "Checking Scenario5"
		conflicts = scenario5(person)
		display_conflicts(conflicts,person) if conflicts.count > 0	
		puts "Checking Scenario6"
		conflicts = scenario6(person)
		display_conflicts(conflicts,person) if conflicts.count > 0		
		puts "Checking Scenario7"
		conflicts = scenario7(person)
		display_conflicts(conflicts,person) if conflicts.count > 0	
	end  
end

def start
	check_against_scenario
end

start
