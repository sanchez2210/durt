# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_311_072_306) do
  create_table 'issues', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'source', null: false
    t.integer 'project_id', null: false
    t.text 'summary', null: false
    t.integer 'estimate'
    t.boolean 'active', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['project_id'], name: 'index_issues_on_project_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'name', null: false
    t.boolean 'active', default: false, null: false
  end

  create_table 'sessions', force: :cascade do |t|
    t.integer 'issue_id', null: false
    t.datetime 'open_at', null: false
    t.datetime 'closed_at'
    t.index ['issue_id'], name: 'index_sessions_on_issue_id'
  end

  create_table 'statuses', force: :cascade do |t|
    t.string 'source_id'
    t.string 'name', null: false
    t.boolean 'active', default: false, null: false
    t.string 'source', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
