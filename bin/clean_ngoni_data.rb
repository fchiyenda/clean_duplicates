require 'damerau-levenshtein'
require 'date'
require 'terminal-table'

@comparision_data = {}
@people = {}
@conflict_ids = []
@progress = 0

def get_source_data
	source_data = ActiveRecord::Base.connection.select_all <<EOF
		SELECT p.person_id,pi.identifier npid,identifier_type,
    (SELECT group_concat(pi2.identifier) legacy
        FROM
            openmrs_ngoni.patient_identifier pi2
        WHERE
            p.person_id = pi2.patient_id
                AND identifier_type = 2
        GROUP BY patient_id) legacy_ids,
    pi.date_created,
    given_name,
    middle_name,
    family_name,
    gender,
    birthdate,
    birthdate_estimated,
    death_date,
    pa.*
FROM
    openmrs_ngoni.person p
        LEFT JOIN
    openmrs_ngoni.patient_identifier pi ON p.person_id = pi.patient_id
        LEFT JOIN
    openmrs_ngoni.person_name pn ON p.person_id = pn.person_id
        LEFT JOIN
    openmrs_ngoni.person_address pa ON p.person_id = pa.person_id
where
    p.voided = 0 and pi.identifier_type = 3
    AND pi.voided = 0
    AND pa.voided = 0 AND pn.voided = 0
group by p.person_id , pi.identifier;

EOF

data = []
 source_data.each do |person|
   person_attributes = ActiveRecord::Base.connection.select_one <<EOF
    SELECT pa.person_id,pa1.value citizenship, pa2.value occupation,pa3.value home_phone_number, pa4.value cell_phone_number, pa5.value office_phone_number FROM person_attribute pa
LEFT JOIN person_attribute pa1 on pa.person_id = pa1.person_id AND pa1.person_attribute_type_id = 3 AND pa1.voided = 0
LEFT JOIN person_attribute pa2 on pa.person_id = pa2.person_id AND pa2.person_attribute_type_id = 13 AND pa2.voided = 0 AND pa2.voided = 0
LEFT JOIN person_attribute pa3 on pa.person_id = pa3.person_id AND pa3.person_attribute_type_id = 14 AND pa3.voided = 0
LEFT JOIN person_attribute pa4 on pa.person_id = pa4.person_id AND pa4.person_attribute_type_id = 12 AND pa4.voided = 0
LEFT JOIN person_attribute pa5 on pa.person_id = pa5.person_id AND pa5.person_attribute_type_id = 15 AND pa1.voided = 0
WHERE pa.person_id = '#{person['person_id']}'
group by pa.person_id;

EOF

person_attributes = {'citizenship'=> nil, 'occupation'=> nil,
                    'home_phone_number'=> nil, 'cell_phone_number'=> nil,'office_phone_number'=> nil} if person_attributes.nil?


person.merge!(person_attributes)

data << person

end

  return data
end

def scenario1(person)
  potential_duplicates = []
  @comparision_data.each do |p|
  	 	next if person['person_id'] == p['person_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 &&
  	   DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 &&
  	   person['gender'] == p['gender'] && 
  	   person['dob'] == p['dob'] && 
  	   person['dob_estimated'] == p['dob_estimated'] && 
  	   DamerauLevenshtein.distance("#{person['home_village']}","#{p['home_village']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario2(person)
  potential_duplicates = []
  @comparision_data.each do |p|
  	next if person['person_id'] == p['person_id']
  	if (DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2) &&    (DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2) && (person['gender'] == p['gender']) && 
  		(person['dob'] == p['dob'])

      potential_duplicates << p
    end
  end
  return potential_duplicates
end

def scenario3(person)
	potential_duplicates = []
  @comparision_data.each do |p|
  	next if person['person_id'] == p['person_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['gender'] == p['gender'] \
  		 && (person['dob'].year - p['dob'].year).abs <= 2 \
  		 && person['dob_estimated'] == p['dob_estimated'] \
  		 && DamerauLevenshtein.distance("#{person['home_village']}","#{p['home_village']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario4(person)
	potential_duplicates = []
  @comparision_data.each do |p|
  	next if person['person_id'] == p['person_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['dob'] == p['dob'] \
  		 && person['dob_estimated'] == p['dob_estimated'] \
  		 && DamerauLevenshtein.distance("#{person['home_village']}","#{p['home_village']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario5(person)
	potential_duplicates = []
  @comparision_data.each do |p|
  	next if person['person_id'] == p['person_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['gender'] == p['gender'] \
  		 && (person['dob'].year - p['dob'].year).abs <= 2 \
  		 && person['dob_estimated'] == p['dob_estimated']

       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario6(person)
	potential_duplicates = []
  @comparision_data.each do |p|
  	next if person['person_id'] == p['person_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2 \
  		 && person['dob'] == p['dob'] \
  		 && person['dob_estimated'] == p['dob_estimated']
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def scenario7(person)
	potential_duplicates = []
  @comparision_data.each do |p|
  	next if person['person_id'] == p['person_id']
  	if DamerauLevenshtein.distance("#{person['given_name']}","#{p['given_name']}") <= 2 \
  		 && DamerauLevenshtein.distance("#{person['family_name']}","#{p['family_name']}") <= 2
       
       potential_duplicates << p
  	end
  end

  return potential_duplicates
end

def display_conflicts(conflicts,person,scenario)
  heading = ['Person id','Identifier','Given Name', 'Middle Name', \
              'Family name','Gender','DOB','DOB Est', \
              'Home District','Home Ta','Home Village','Current District', \
              'Current Ta','Current Village','Occupation','Date Created']
    rows = []
	conflicts.each do |conflict|
    rows.clear
    rows << [person['person_id'],person['identifier'],person['given_name'], \
            person['middle_name'], person['family_name'],person['gender'], \
            person['dob'],person['dob_estimated'],person['home_district'], \
            person['home_ta'],person['home_village'], \
            person['current_district'],person['current_ta'], \
            person['current_village'],person['occupation'],person['created_at']]

    rows << [conflict['person_id'],conflict['identifier'], \
            conflict['given_name'],conflict['middle_name'], \
            conflict['family_name'],conflict['gender'], \
            conflict['dob'],conflict['dob_estimated'], \
            conflict['home_district'],conflict['home_ta'], \
            conflict['home_village'], \
            conflict['current_district'],conflict['current_ta'], \
            conflict['current_village'], \
            conflict['occupation'],conflict['created_at']]    

    table = Terminal::Table.new :headings => heading, :rows => rows

    puts table

    puts "Duplicate record? (Y/N or y/n default n):"
    # response = gets.chomp
    # if response.downcase == 'y'
    # Save the conflict record on conflict table
      save_conflict(conflict,scenario.to_i,person['merge_id'])
    # Remove the id from the comparision variable
      delete_conflict(conflict['merge_id'])
      puts 'Refreshing data'
      @people.delete_if{|r| r['merge_id'] == person['merge_id']}
      @comparision_data.delete_if{|row| row['merge_id'] == person['merge_id']}
      puts @people.count
      puts @comparision_data.count


      check_against_scenario(@people)
    #end
  end
end

def delete_conflict(merge_id)
  ActiveRecord::Base.connection.execute <<EOF
    DELETE FROM ngoni_person WHERE merge_id = #{merge_id};
EOF

end

def save_conflict(conflict_person,conflict_reason,conflict_person_merge_id_ref)
   ActiveRecord::Base.connection.execute <<EOF
    INSERT INTO ngoni_person_conflict values (
        NULL,
        "#{conflict_person['person_id']}",
        "#{conflict_person['identifier']}",
        "#{conflict_person['source']}",
        "#{conflict_person['merge_id']}",
         #{conflict_person_merge_id_ref},
        #{conflict_reason},
        "#{conflict_person['given_name']}",
        "#{conflict_person['middle_name']}",
        "#{conflict_person['family_name']}",
        "#{conflict_person['gender']}",
        "#{conflict_person['dob']}",
        "#{conflict_person['DOB_estimated'].to_i}",
        "#{conflict_person['closest_landmark']}",
        "#{conflict_person['current_residence']}",
        "#{conflict_person['current_village']}",
        "#{conflict_person['current_ta']}",
        "#{conflict_person['current_district']}",
        "#{conflict_person['home_village']}",
        "#{conflict_person['home_ta']}",
        "#{conflict_person['home_district']}",
        "#{conflict_person['country_of_residence']}",
        "#{conflict_person['citizenship']}",
        "#{conflict_person['occupation']}",
        "#{conflict_person['home_phone_number']}",
        "#{conflict_person['cell_phone_number']}",
        "#{conflict_person['office_phone_number']}",
        "#{conflict_person['created_at']}",
        "#{conflict_person['assigned_site']}");
EOF

end

def create_table
  ActiveRecord::Base.connection.execute <<EOF
      DROP TABLE IF EXISTS ngoni_person;
EOF

  ActiveRecord::Base.connection.execute <<EOF
      DROP TABLE IF EXISTS ngoni_person_conflict;
EOF

ActiveRecord::Base.connection.execute <<EOF
  CREATE TABLE ngoni_person(
   merge_id INT auto_increment NOT NULL,
   person_id INT NULL,
   identifier VARCHAR(255) NULL,
   source VARCHAR(255) NULL,
   given_name VARCHAR(255) NULL,
   middle_name VARCHAR(255) NULL,
  family_name VARCHAR(255) NULL,
  gender VARCHAR(255) NULL,
  dob DATE NULL,
  dob_estimated BOOLEAN NULL,
  closest_landmark VARCHAR(255) NULL,
  current_residence VARCHAR(255) NULL,
  current_village VARCHAR(255) NULL,
  current_ta VARCHAR(255) NULL,
  current_district VARCHAR(255) NULL,
  home_village VARCHAR(255) NULL,
  home_ta VARCHAR(255) NULL,
  home_district VARCHAR(255) NULL,
  country_of_residence VARCHAR(255) NULL,
  citizenship VARCHAR(255) NULL,
  occupation VARCHAR(255) NULL,
  home_phone_number VARCHAR(255) NULL,
  cell_phone_number VARCHAR(255) NULL,
  office_phone_number VARCHAR(255) NULL,
  created_at VARCHAR(255) NULL,
  assigned_site VARCHAR(255) NULL,  
  PRIMARY KEY (merge_id));
EOF

ActiveRecord::Base.connection.execute <<EOF
  CREATE TABLE ngoni_person_conflict(
  merge_conflict_id INT auto_increment,
  person_id INT NULL,
  identifier VARCHAR(255) NULL,
  source VARCHAR(255) NULL,
  merge_id INT NOT NULL,
  merge_conflict_id_ref INT NOT NULL,
  conflict_reason INT NOT NULL,
  given_name VARCHAR(255) NULL,
  middle_name VARCHAR(255) NULL,
  family_name VARCHAR(255) NULL,
  gender VARCHAR(255) NULL,
  dob DATE NULL,
  dob_estimated BOOLEAN NULL,
  closest_landmark VARCHAR(255) NULL,
  current_residence VARCHAR(255) NULL,
  current_village VARCHAR(255) NULL,
  current_ta VARCHAR(255) NULL,
  current_district VARCHAR(255) NULL,
  home_village VARCHAR(255) NULL,
  home_ta VARCHAR(255) NULL,
  home_district VARCHAR(255) NULL,
  country_of_residence VARCHAR(255) NULL,
  citizenship VARCHAR(255) NULL,
  occupation VARCHAR(255) NULL,
  home_phone_number VARCHAR(255) NULL,
  cell_phone_number VARCHAR(255) NULL,
  office_phone_number VARCHAR(255) NULL,
  created_at VARCHAR(255) NULL,
  assigned_site VARCHAR(255) NULL,  
  PRIMARY KEY (merge_conflict_id));
EOF

end

def format_data
  person = get_source_data
  i = 1
  data = ''
  person.each do |per|

   
    puts "processing #{per['npid']} .. record number #{i}"

    if per['birthdate_estimated'] == true
      dob_est = 1
    elsif per['birthdate_estimated'] == false
      dob_est = 0
    else
      dob_est = per['birthdate_estimated']
    end

    test1 = "NULL," +
            "\"#{per['person_id']}\"," +
            "\"#{per['npid']}\"," +
            "\"Ngoni\"," +
            "\"#{per['given_name'].to_s.gsub("'","\'\\\\\'\'")}\"," +
            "\"#{per['middle_name'].to_s.gsub("'","\'\\\\\'\'")}\"," +
            "\"#{per['family_name'].to_s.gsub("'","\'\\\\\'\'")}\"," +
            "\"#{per['gender']}\"," +
            "\"#{per['birthdate']}\"," +
            "#{dob_est}," +
            "\"#{per['address1'].to_s.gsub("'","\'\\\\\'\'")}\"," + #closest landmark
            "NULL," + #current_residence
            "\"#{per['city_village'].to_s.gsub("'","\'\\\\\'\'")}\"," + #current Village
            "\"#{per['current_ta'].to_s.gsub("'","\'\\\\\'\'")}\"," + #Not available in dde1
            "\"#{per['state_province'].to_s.gsub("'","\'\\\\\'\'")}\"," + #Current District
            "\"#{per['neighborhood_cell'].to_s.gsub("'","\'\\\\\'\'")}\"," + #Home Village
            "\"#{per['county_district'].to_s.gsub("'","\'\\\\\'\'")}\"," + # Home ta
            "\"#{per['address2'].to_s.gsub("'","\'\\\\\'\'")}\","  # Home District
            test1 = test1 + "\"#{per['country_of_residence'].to_s.gsub("'","\'\\\\\'\'")}\"," +
                "\"#{per['citizenship'].to_s.gsub("'","\'\\\\\'\'")}\"," +
                "\"#{per['occupation'].to_s.gsub("'","\'\\\\\'\'")}\"," +
                "\"#{per['home_phone_number']}\"," +
                "\"#{per['cell_phone_number']}\"," +
                "\"#{per['office_phone_number']}\","
            test1 = test1 + "\"#{per['date_created']}\"," +
              "\"#{per['assigned_site']}\""
     
     data += "(#{test1}),"
      
     if (i % 1_000).zero? || person.count.to_i == i
          data.chomp!(',')
          puts 'Loading data into MySQL'
          begin
            ActiveRecord::Base.connection.execute <<EOF
            INSERT INTO ngoni_person values #{data};
EOF
          rescue StandardError => e
          `echo "#{e}" >> #{Rails.root}/log/ngoni_load_into_flattable.log`
          end
          data.clear
     end
    i += 1 
 end
end

def get_data
  data = ActiveRecord::Base.connection.select_all <<EOF
  SELECT * FROM ngoni_person order by merge_id;

EOF

return data.to_a
end

def check_against_scenario(people)
	#Read where we left off
  @progress = File.read('log/cleaning_progress.log') rescue 0


  @people.each do |person|
    next if person['merge_id'].to_i <= @progress.to_i
    puts "Checking #{person['identifier']} record number" \
         "..#{person['merge_id']}"
    puts "Checking Scenario1"
    conflicts = scenario1(person)
		display_conflicts(conflicts,person,1) if conflicts.count > 0	
		puts "Checking Scenario2"
		conflicts = scenario2(person)	
		display_conflicts(conflicts,person,2) if conflicts.count > 0
		puts "Checking Scenario3"
		conflicts = scenario3(person)
		display_conflicts(conflicts,person,3) if conflicts.count > 0
		puts "Checking Scenario4"
		conflicts = scenario4(person)
		display_conflicts(conflicts,person,4) if conflicts.count > 0	
		puts "Checking Scenario5"
		conflicts = scenario5(person)
		display_conflicts(conflicts,person,5) if conflicts.count > 0	
		puts "Checking Scenario6"
		conflicts = scenario6(person)
		display_conflicts(conflicts,person,6) if conflicts.count > 0
=begin		
		puts "Checking Scenario7"
		conflicts = scenario7(person)
		display_conflicts(conflicts,person,7) if conflicts.count > 0
=end
    `echo #{person['merge_id']} > log/cleaning_progress.log`
  end 
end

def start
  # create_table
  # format_data
  puts 'Getting data from source'
  @people = get_data
  @comparision_data = get_data
  check_against_scenario(@people)
end

start
