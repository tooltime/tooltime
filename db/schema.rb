# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120215190618) do

  create_table "comparisons", :force => true do |t|
    t.string   "state"
    t.string   "species"
    t.string   "cell_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "experiments", :force => true do |t|
    t.string   "label"
    t.string   "tess"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "comparison_id"
  end

  create_table "genes", :force => true do |t|
    t.string   "abbrev"
    t.string   "name"
    t.string   "species"
    t.integer  "chromosome"
    t.integer  "beg_site"
    t.integer  "end_site"
    t.string   "regulation"
    t.string   "length"
    t.string   "email"
    t.integer  "transfac_strs"
    t.integer  "mysite_strs"
    t.integer  "selected_one"
    t.integer  "transfac_matrices"
    t.integer  "imd_matrices"
    t.integer  "cbil_matrices"
    t.integer  "jaspar_matrices"
    t.integer  "myweight_matrices"
    t.integer  "selected_two"
    t.string   "combine"
    t.string   "factor_attribute_one"
    t.string   "matches"
    t.integer  "core_positions"
    t.integer  "tmm"
    t.integer  "ts_a"
    t.integer  "tw"
    t.integer  "ta"
    t.string   "group_selection_one"
    t.integer  "td"
    t.float    "tc"
    t.float    "tm"
    t.integer  "lg_likelihood_deficit"
    t.float    "sig_threshold"
    t.integer  "selected_three"
    t.float    "pseudo_counts"
    t.string   "group_selection_two"
    t.integer  "a_tcontent"
    t.float    "a_distribution"
    t.float    "c_distribution"
    t.float    "t_distribution"
    t.float    "g_distribution"
    t.string   "ambiguous"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "experiment_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages_regulatory_elements", :force => true do |t|
    t.integer "regulatory_element_id"
    t.integer "page_id"
  end

  create_table "promoters", :force => true do |t|
    t.string   "sequence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "gene_id"
  end

  create_table "regulatory_elements", :force => true do |t|
    t.integer  "beg"
    t.integer  "len"
    t.string   "sns"
    t.string   "model"
    t.string   "sequence"
    t.float    "la"
    t.float    "la_slash"
    t.float    "lq"
    t.float    "ld"
    t.float    "ppv"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "gene_id"
  end

  create_table "regulatory_elements_transcription_factors", :force => true do |t|
    t.integer "regulatory_element_id"
    t.integer "transcription_factor_id"
  end

  create_table "transcription_factors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
