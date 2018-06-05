# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180604141942) do

  create_table "global_properties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.binary   "property",       limit: 65535
    t.text     "property_value", limit: 65535
    t.text     "description",    limit: 65535
    t.text     "uuid",           limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "global_property", primary_key: "property", id: :binary, limit: 255, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text   "property_value", limit: 16777215
    t.text   "description",    limit: 65535
    t.string "uuid",           limit: 38,       null: false
    t.index ["uuid"], name: "global_property_uuid_index", unique: true, using: :btree
  end

  create_table "patient_identifier", primary_key: "patient_identifier_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id",                 default: 0,  null: false
    t.string   "identifier",      limit: 50, default: "", null: false
    t.integer  "identifier_type",            default: 0,  null: false
    t.integer  "preferred",       limit: 2,  default: 0,  null: false
    t.integer  "location_id",                default: 0,  null: false
    t.integer  "creator",                    default: 0,  null: false
    t.datetime "date_created",                            null: false
    t.integer  "voided",          limit: 2,  default: 0,  null: false
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.string   "void_reason"
    t.string   "uuid",            limit: 38,              null: false
    t.index ["creator"], name: "identifier_creator", using: :btree
    t.index ["identifier"], name: "identifier_name", using: :btree
    t.index ["identifier_type"], name: "defines_identifier_type", using: :btree
    t.index ["location_id"], name: "identifier_location", using: :btree
    t.index ["patient_id"], name: "idx_patient_identifier_patient", using: :btree
    t.index ["uuid"], name: "patient_identifier_uuid_index", unique: true, using: :btree
    t.index ["voided_by"], name: "identifier_voider", using: :btree
  end

  create_table "patient_identifier_type", primary_key: "patient_identifier_type_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",               limit: 50,    default: "", null: false
    t.text     "description",        limit: 65535,              null: false
    t.string   "format",             limit: 50
    t.integer  "check_digit",        limit: 2,     default: 0,  null: false
    t.integer  "creator",                          default: 0,  null: false
    t.datetime "date_created",                                  null: false
    t.integer  "required",           limit: 2,     default: 0,  null: false
    t.string   "format_description"
    t.string   "validator",          limit: 200
    t.integer  "retired",            limit: 2,     default: 0,  null: false
    t.integer  "retired_by"
    t.datetime "date_retired"
    t.string   "retire_reason"
    t.string   "uuid",               limit: 38,                 null: false
    t.index ["creator"], name: "type_creator", using: :btree
    t.index ["retired"], name: "retired_status", using: :btree
    t.index ["retired_by"], name: "user_who_retired_patient_identifier_type", using: :btree
    t.index ["uuid"], name: "patient_identifier_type_uuid_index", unique: true, using: :btree
  end

  create_table "patient_identifier_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "patient_identifier_type_id"
    t.text     "name",                       limit: 65535
    t.text     "description",                limit: 65535
    t.text     "format",                     limit: 65535
    t.integer  "check_digit"
    t.integer  "creator"
    t.datetime "date_created"
    t.integer  "required"
    t.text     "format_description",         limit: 65535
    t.text     "validator",                  limit: 65535
    t.integer  "retired"
    t.integer  "retired_by"
    t.datetime "date_retired"
    t.text     "retire_reason",              limit: 65535
    t.text     "uuid",                       limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "patient_identifiers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "patient_identifier_id"
    t.integer  "patient_id"
    t.text     "identifier",            limit: 65535
    t.integer  "identifier_type"
    t.integer  "preferred"
    t.integer  "location_id"
    t.integer  "creator"
    t.datetime "date_created"
    t.integer  "voided"
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.text     "void_reason",           limit: 65535
    t.text     "uuid",                  limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "person_id"
    t.text     "gender",              limit: 65535
    t.datetime "birthdate"
    t.integer  "birthdate_estimated"
    t.integer  "dead"
    t.datetime "death_date"
    t.text     "cause_of_death",      limit: 65535
    t.integer  "creator"
    t.datetime "date_created"
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.integer  "voided"
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.text     "void_reason",         limit: 65535
    t.text     "uuid",                limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "person", primary_key: "person_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "gender",              limit: 50, default: ""
    t.date     "birthdate"
    t.integer  "birthdate_estimated", limit: 2,  default: 0,  null: false
    t.integer  "dead",                limit: 2,  default: 0,  null: false
    t.datetime "death_date"
    t.integer  "cause_of_death"
    t.integer  "creator",                        default: 0,  null: false
    t.datetime "date_created",                                null: false
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.integer  "voided",              limit: 2,  default: 0,  null: false
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.string   "void_reason"
    t.string   "uuid",                limit: 38,              null: false
    t.index ["birthdate"], name: "person_birthdate", using: :btree
    t.index ["cause_of_death"], name: "person_died_because", using: :btree
    t.index ["changed_by"], name: "user_who_changed_pat", using: :btree
    t.index ["creator"], name: "user_who_created_patient", using: :btree
    t.index ["death_date"], name: "person_death_date", using: :btree
    t.index ["uuid"], name: "person_uuid_index", unique: true, using: :btree
    t.index ["voided_by"], name: "user_who_voided_patient", using: :btree
  end

  create_table "person_address", primary_key: "person_address_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "person_id"
    t.integer  "preferred",         limit: 2,  default: 0, null: false
    t.string   "address1",          limit: 50
    t.string   "address2",          limit: 50
    t.string   "city_village",      limit: 50
    t.string   "state_province",    limit: 50
    t.string   "postal_code",       limit: 50
    t.string   "country",           limit: 50
    t.string   "latitude",          limit: 50
    t.string   "longitude",         limit: 50
    t.integer  "creator",                      default: 0, null: false
    t.datetime "date_created",                             null: false
    t.integer  "voided",            limit: 2,  default: 0, null: false
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.string   "void_reason"
    t.string   "county_district",   limit: 50
    t.string   "neighborhood_cell", limit: 50
    t.string   "region",            limit: 50
    t.string   "subregion",         limit: 50
    t.string   "township_division", limit: 50
    t.string   "uuid",              limit: 38,             null: false
    t.index ["creator"], name: "patient_address_creator", using: :btree
    t.index ["person_id"], name: "patient_addresses", using: :btree
    t.index ["uuid"], name: "person_address_uuid_index", unique: true, using: :btree
    t.index ["voided_by"], name: "patient_address_void", using: :btree
  end

  create_table "person_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "person_address_id"
    t.integer  "person_id"
    t.integer  "preferred"
    t.text     "address1",          limit: 65535
    t.text     "address2",          limit: 65535
    t.text     "city_village",      limit: 65535
    t.text     "state_province",    limit: 65535
    t.text     "postal_code",       limit: 65535
    t.text     "country",           limit: 65535
    t.text     "latitude",          limit: 65535
    t.text     "longitude",         limit: 65535
    t.integer  "creator"
    t.datetime "date_created"
    t.integer  "voided"
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.text     "voided_reason",     limit: 65535
    t.text     "county_district",   limit: 65535
    t.text     "neighborhood_cell", limit: 65535
    t.text     "region",            limit: 65535
    t.text     "subregion",         limit: 65535
    t.text     "township_division", limit: 65535
    t.text     "uuid",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "person_attribute", primary_key: "person_attribute_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "person_id",                           default: 0,  null: false
    t.string   "value",                    limit: 50, default: "", null: false
    t.integer  "person_attribute_type_id",            default: 0,  null: false
    t.integer  "creator",                             default: 0,  null: false
    t.datetime "date_created",                                     null: false
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.integer  "voided",                   limit: 2,  default: 0,  null: false
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.string   "void_reason"
    t.string   "uuid",                     limit: 38,              null: false
    t.index ["changed_by"], name: "attribute_changer", using: :btree
    t.index ["creator"], name: "attribute_creator", using: :btree
    t.index ["person_attribute_type_id"], name: "defines_attribute_type", using: :btree
    t.index ["person_id"], name: "identifies_person", using: :btree
    t.index ["uuid"], name: "person_attribute_uuid_index", unique: true, using: :btree
    t.index ["voided_by"], name: "attribute_voider", using: :btree
  end

  create_table "person_attribute_type", primary_key: "person_attribute_type_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",           limit: 50,    default: "", null: false
    t.text     "description",    limit: 65535,              null: false
    t.string   "format",         limit: 50
    t.integer  "foreign_key"
    t.integer  "searchable",     limit: 2,     default: 0,  null: false
    t.integer  "creator",                      default: 0,  null: false
    t.datetime "date_created",                              null: false
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.integer  "retired",        limit: 2,     default: 0,  null: false
    t.integer  "retired_by"
    t.datetime "date_retired"
    t.string   "retire_reason"
    t.string   "edit_privilege"
    t.string   "uuid",           limit: 38,                 null: false
    t.float    "sort_weight",    limit: 53
    t.index ["changed_by"], name: "attribute_type_changer", using: :btree
    t.index ["creator"], name: "type_creator", using: :btree
    t.index ["edit_privilege"], name: "privilege_which_can_edit", using: :btree
    t.index ["name"], name: "name_of_attribute", using: :btree
    t.index ["retired"], name: "person_attribute_type_retired_status", using: :btree
    t.index ["retired_by"], name: "user_who_retired_person_attribute_type", using: :btree
    t.index ["searchable"], name: "attribute_is_searchable", using: :btree
    t.index ["uuid"], name: "person_attribute_type_uuid_index", unique: true, using: :btree
  end

  create_table "person_attribute_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "person_attribute_type_id"
    t.text     "name",                     limit: 65535
    t.text     "description",              limit: 65535
    t.text     "format",                   limit: 65535
    t.integer  "foreign_key"
    t.integer  "searchable"
    t.integer  "creator"
    t.datetime "date_created"
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.integer  "retired"
    t.integer  "retired_by"
    t.datetime "date_retired"
    t.text     "retire_reason",            limit: 65535
    t.text     "edit_privilege",           limit: 65535
    t.text     "uuid",                     limit: 65535
    t.string   "sort_weight"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "person_attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "person_attribute_id"
    t.integer  "person_id"
    t.text     "value",                    limit: 65535
    t.integer  "person_attribute_type_id"
    t.integer  "creator"
    t.datetime "date_created"
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.integer  "voided"
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.text     "voided_reason",            limit: 65535
    t.text     "uuid",                     limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "person_name", primary_key: "person_name_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "preferred",          limit: 2,  default: 0, null: false
    t.integer  "person_id"
    t.string   "prefix",             limit: 50
    t.string   "given_name",         limit: 50
    t.string   "middle_name",        limit: 50
    t.string   "family_name_prefix", limit: 50
    t.string   "family_name",        limit: 50
    t.string   "family_name2",       limit: 50
    t.string   "family_name_suffix", limit: 50
    t.string   "degree",             limit: 50
    t.integer  "creator",                       default: 0, null: false
    t.datetime "date_created",                              null: false
    t.integer  "voided",             limit: 2,  default: 0, null: false
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.string   "void_reason"
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.string   "uuid",               limit: 38,             null: false
    t.index ["creator"], name: "user_who_made_name", using: :btree
    t.index ["family_name"], name: "last_name", using: :btree
    t.index ["family_name2"], name: "family_name2", using: :btree
    t.index ["given_name"], name: "first_name", using: :btree
    t.index ["middle_name"], name: "middle_name", using: :btree
    t.index ["person_id"], name: "name_for_patient", using: :btree
    t.index ["uuid"], name: "person_name_uuid_index", unique: true, using: :btree
    t.index ["voided_by"], name: "user_who_voided_name", using: :btree
  end

  create_table "person_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "person_name_id"
    t.integer  "preferred"
    t.integer  "person_id"
    t.text     "prefix",             limit: 65535
    t.text     "given_name",         limit: 65535
    t.text     "middle_name",        limit: 65535
    t.text     "family_name_prefix", limit: 65535
    t.text     "family_name",        limit: 65535
    t.text     "family_name2",       limit: 65535
    t.text     "family_name_suffix", limit: 65535
    t.text     "degree",             limit: 65535
    t.integer  "creator"
    t.datetime "date_created"
    t.integer  "voided"
    t.integer  "voided_by"
    t.datetime "date_voided"
    t.text     "void_reason",        limit: 65535
    t.integer  "changed_by"
    t.datetime "date_changed"
    t.text     "uuid",               limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_foreign_key "patient_identifier", "location", primary_key: "location_id", name: "patient_identifier_ibfk_2"
  add_foreign_key "patient_identifier", "patient", primary_key: "patient_id", name: "identifies_patient"
  add_foreign_key "patient_identifier", "patient_identifier_type", column: "identifier_type", primary_key: "patient_identifier_type_id", name: "defines_identifier_type"
  add_foreign_key "patient_identifier", "users", column: "creator", primary_key: "user_id", name: "identifier_creator"
  add_foreign_key "patient_identifier", "users", column: "voided_by", primary_key: "user_id", name: "identifier_voider"
  add_foreign_key "patient_identifier_type", "users", column: "creator", primary_key: "user_id", name: "type_creator"
  add_foreign_key "patient_identifier_type", "users", column: "retired_by", primary_key: "user_id", name: "user_who_retired_patient_identifier_type"
