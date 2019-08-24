# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_28_150131) do

  create_table "academic_terms", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "grading_system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_academic_terms_on_deleted_at"
    t.index ["grading_system_id"], name: "index_academic_terms_on_grading_system_id"
  end

  create_table "academic_years", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acadmic_agendas", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "description"
    t.string "start"
    t.string "end"
    t.string "title"
    t.string "category"
    t.integer "stage_id"
    t.integer "section_id"
    t.integer "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_acadmic_agendas_on_deleted_at"
  end

  create_table "admins", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_school"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_admins_on_deleted_at"
  end

  create_table "admins_levels", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "level_id"
    t.datetime "deleted_at"
    t.index ["admin_id", "level_id"], name: "index_admins_levels_on_admin_id_and_level_id"
    t.index ["deleted_at"], name: "index_admins_levels_on_deleted_at"
  end

  create_table "admins_sections", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "section_id"
    t.datetime "deleted_at"
    t.index ["admin_id", "section_id"], name: "index_admins_sections_on_admin_id_and_section_id"
    t.index ["deleted_at"], name: "index_admins_sections_on_deleted_at"
  end

  create_table "admins_stages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "stage_id"
    t.datetime "deleted_at"
    t.index ["admin_id", "stage_id"], name: "index_admins_stages_on_admin_id_and_stage_id"
    t.index ["deleted_at"], name: "index_admins_stages_on_deleted_at"
  end

  create_table "announcement_receivers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "announcement_id"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["announcement_id"], name: "index_announcement_receivers_on_announcement_id"
    t.index ["deleted_at"], name: "index_announcement_receivers_on_deleted_at"
  end

  create_table "announcements", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_id"
    t.datetime "deleted_at"
    t.string "image"
    t.index ["admin_id"], name: "index_announcements_on_admin_id"
    t.index ["deleted_at"], name: "index_announcements_on_deleted_at"
  end

  create_table "answer_submissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_submission_id"
    t.integer "answer_id"
    t.boolean "is_correct", null: false
    t.integer "question_id"
    t.string "match"
    t.datetime "deleted_at"
    t.index ["answer_id"], name: "index_answer_submissions_on_answer_id"
    t.index ["deleted_at"], name: "index_answer_submissions_on_deleted_at"
    t.index ["question_id"], name: "index_answer_submissions_on_question_id"
    t.index ["quiz_submission_id"], name: "index_answer_submissions_on_quiz_submission_id"
  end

  create_table "answers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "body"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.string "match"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_answers_on_deleted_at"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "assignment_qusetions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "assignment_id"
    t.integer "question_id"
    t.boolean "required", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["assignment_id"], name: "index_assignment_qusetions_on_assignment_id"
    t.index ["deleted_at"], name: "index_assignment_qusetions_on_deleted_at"
    t.index ["question_id"], name: "index_assignment_qusetions_on_question_id"
  end

  create_table "assignments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "points"
    t.integer "difficulty", default: 1
    t.boolean "assignment_type", default: true
    t.integer "state", default: 1
    t.integer "duration"
    t.integer "lesson_id"
    t.integer "objective_id"
    t.integer "scale_id"
    t.boolean "student_can_comment", default: true
    t.boolean "student_can_edit_answer", default: true
    t.boolean "student_can_view_correct_answer", default: true
    t.boolean "no_submissions", default: false
    t.datetime "late_submissions_date"
    t.decimal "late_submission_points", precision: 10
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "file"
    t.text "content", size: :medium
    t.integer "course_id"
    t.integer "chapter_id"
    t.boolean "late_submission", default: false
    t.integer "creatable_id"
    t.string "creatable_type"
    t.integer "category_id"
    t.boolean "hard_copy", default: false
    t.boolean "online_text", default: false
    t.boolean "file_upload", default: false
    t.string "blooms"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "downloads_number", default: 0
    t.datetime "deleted_at"
    t.integer "grading_period_id"
    t.index ["category_id"], name: "index_assignments_on_category_id"
    t.index ["chapter_id"], name: "index_assignments_on_chapter_id"
    t.index ["course_id"], name: "index_assignments_on_course_id"
    t.index ["creatable_type", "creatable_id"], name: "index_assignments_on_creatable_type_and_creatable_id"
    t.index ["end_at"], name: "index_assignments_on_end_at"
    t.index ["grading_period_id"], name: "index_assignments_on_grading_period_id"
  end

  create_table "assignments_course_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_group_id", null: false
    t.integer "assignment_id", null: false
    t.datetime "deleted_at"
    t.boolean "hide_grade", default: false
    t.boolean "assigned_all_students", default: true
    t.index ["assignment_id", "course_group_id"], name: "assignment_has_many_course_groups", unique: true
    t.index ["assignment_id"], name: "index_assignments_course_groups_on_assignment_id"
    t.index ["course_group_id"], name: "index_assignments_course_groups_on_course_group_id"
    t.index ["deleted_at"], name: "index_assignments_course_groups_on_deleted_at"
  end

  create_table "assignments_objectives", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "assignment_id"
    t.integer "objective_id"
    t.datetime "deleted_at"
    t.index ["assignment_id"], name: "index_assignments_objectives_on_assignment_id"
    t.index ["deleted_at"], name: "index_assignments_objectives_on_deleted_at"
    t.index ["objective_id"], name: "index_assignments_objectives_on_objective_id"
  end

  create_table "attendances", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.date "date", null: false
    t.text "comment"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "timetable_slot_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_attendances_on_deleted_at"
    t.index ["student_id"], name: "index_attendances_on_student_id"
    t.index ["timetable_slot_id"], name: "index_attendances_on_timetable_slot_id"
  end

  create_table "automated_demos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_automated_demos_on_deleted_at"
  end

  create_table "badges", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon_name"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_badges_on_deleted_at"
  end

  create_table "banners", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "image"
    t.string "scope_type"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "banner_type"
    t.index ["school_id"], name: "index_banners_on_school_id"
    t.index ["scope_type"], name: "index_banners_on_scope_type"
  end

  create_table "behavior_note_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_behavior_note_categories_on_deleted_at"
    t.index ["school_id"], name: "index_behavior_note_categories_on_school_id"
  end

  create_table "behavior_note_receivers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "behavior_note_id"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["behavior_note_id"], name: "index_behavior_note_receivers_on_behavior_note_id"
    t.index ["deleted_at"], name: "index_behavior_note_receivers_on_deleted_at"
  end

  create_table "behavior_notes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "category"
    t.integer "owner_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.integer "course_group_id"
    t.integer "type"
    t.integer "behavior_note_category_id"
    t.datetime "deleted_at"
    t.integer "academic_year_id"
    t.index ["academic_year_id"], name: "index_behavior_notes_on_academic_year_id"
    t.index ["course_group_id"], name: "index_behavior_notes_on_course_group_id"
    t.index ["deleted_at"], name: "index_behavior_notes_on_deleted_at"
  end

  create_table "bigbluebutton_meetings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "server_id"
    t.integer "room_id"
    t.string "meetingid"
    t.string "name"
    t.datetime "start_time"
    t.boolean "running", default: false
    t.boolean "recorded", default: false
    t.integer "creator_id"
    t.string "creator_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_meetings_on_deleted_at"
    t.index ["meetingid", "start_time"], name: "index_bigbluebutton_meetings_on_meetingid_and_start_time", unique: true
  end

  create_table "bigbluebutton_metadata", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.string "name"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_metadata_on_deleted_at"
  end

  create_table "bigbluebutton_playback_formats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "recording_id"
    t.integer "playback_type_id"
    t.string "url"
    t.integer "length"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_playback_formats_on_deleted_at"
  end

  create_table "bigbluebutton_playback_types", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "identifier"
    t.boolean "visible", default: false
    t.boolean "default", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_playback_types_on_deleted_at"
  end

  create_table "bigbluebutton_recordings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "server_id"
    t.integer "room_id"
    t.integer "meeting_id"
    t.string "recordid"
    t.string "meetingid"
    t.string "name"
    t.boolean "published", default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "available", default: true
    t.string "description"
    t.bigint "size", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_recordings_on_deleted_at"
    t.index ["recordid"], name: "index_bigbluebutton_recordings_on_recordid", unique: true
    t.index ["room_id"], name: "index_bigbluebutton_recordings_on_room_id"
  end

  create_table "bigbluebutton_room_options", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "room_id"
    t.string "default_layout"
    t.boolean "presenter_share_only"
    t.boolean "auto_start_video"
    t.boolean "auto_start_audio"
    t.string "background"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_room_options_on_deleted_at"
    t.index ["room_id"], name: "index_bigbluebutton_room_options_on_room_id"
  end

  create_table "bigbluebutton_rooms", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "server_id"
    t.integer "owner_id"
    t.string "owner_type"
    t.string "meetingid"
    t.string "name"
    t.string "attendee_key", default: "ap"
    t.string "moderator_key", default: "mp"
    t.string "welcome_msg"
    t.string "logout_url"
    t.string "voice_bridge", default: "70615"
    t.string "dial_number"
    t.integer "max_participants", default: 25
    t.boolean "private", default: false
    t.boolean "external", default: false
    t.string "param"
    t.boolean "record_meeting", default: false
    t.integer "duration", default: 0
    t.string "attendee_api_password"
    t.string "moderator_api_password"
    t.decimal "create_time", precision: 14
    t.string "moderator_only_message"
    t.boolean "auto_start_recording", default: false
    t.boolean "allow_start_stop_recording", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "course_group_id"
    t.boolean "state", default: true
    t.datetime "deleted_at"
    t.index ["course_group_id"], name: "index_bigbluebutton_rooms_on_course_group_id"
    t.index ["deleted_at"], name: "index_bigbluebutton_rooms_on_deleted_at"
    t.index ["meetingid"], name: "index_bigbluebutton_rooms_on_meetingid", unique: true
    t.index ["server_id"], name: "index_bigbluebutton_rooms_on_server_id"
  end

  create_table "bigbluebutton_server_configs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "server_id"
    t.text "available_layouts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_server_configs_on_deleted_at"
  end

  create_table "bigbluebutton_servers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "salt"
    t.string "version"
    t.string "param"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bigbluebutton_servers_on_deleted_at"
  end

  create_table "bookmarks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "bookmarked"
    t.text "url"
    t.string "state"
    t.text "stateParams"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_bookmarks_on_deleted_at"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.decimal "weight", precision: 5, scale: 2
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grading_category_id"
    t.datetime "deleted_at"
    t.integer "parent_id"
    t.boolean "numeric", default: false
    t.index ["course_id"], name: "index_categories_on_course_id"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
    t.index ["grading_category_id"], name: "index_categories_on_grading_category_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "chapters", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "course_id"
    t.text "description"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "lock", default: false
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_chapters_on_course_id"
    t.index ["deleted_at"], name: "index_chapters_on_deleted_at"
  end

  create_table "chief_admins", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_chief_admins_on_deleted_at"
    t.index ["user_id"], name: "index_chief_admins_on_user_id"
  end

  create_table "cities", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "country_id"
    t.string "name"
    t.string "code"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["deleted_at"], name: "index_cities_on_deleted_at"
  end

  create_table "comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "content"
    t.integer "owner_id"
    t.string "owner_username"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
  end

  create_table "completed_lessons", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "course_group_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["course_group_id"], name: "index_completed_lessons_on_course_group_id"
    t.index ["deleted_at"], name: "index_completed_lessons_on_deleted_at"
    t.index ["lesson_id"], name: "index_completed_lessons_on_lesson_id"
    t.index ["teacher_id"], name: "index_completed_lessons_on_teacher_id"
  end

  create_table "countries", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "nationality"
    t.string "currency"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_countries_on_deleted_at"
  end

  create_table "course_comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "comment_key"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "course_contents", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "description"
    t.string "file"
    t.string "name"
    t.integer "downloads_number", default: 0
    t.text "body"
    t.boolean "shared", default: false
    t.boolean "public", default: false
    t.boolean "created_not_uploaded", default: false
    t.datetime "published_at"
    t.integer "course_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_id"
    t.string "content_type"
    t.integer "file_size"
    t.integer "source_teacher_id"
    t.datetime "publish_at"
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_course_contents_on_course_id"
    t.index ["deleted_at"], name: "index_course_contents_on_deleted_at"
    t.index ["lesson_id"], name: "index_course_contents_on_lesson_id"
    t.index ["source_teacher_id"], name: "index_course_contents_on_source_teacher_id"
    t.index ["teacher_id"], name: "index_course_contents_on_teacher_id"
  end

  create_table "course_contents_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_content_id", null: false
    t.integer "course_group_id", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_course_contents_groups_on_deleted_at"
  end

  create_table "course_group_grade_averages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "average"
    t.datetime "week_start_date"
    t.datetime "week_end_date"
    t.integer "course_group_id"
    t.integer "grading_period_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_course_group_grade_averages_on_category_id"
    t.index ["course_group_id"], name: "index_course_group_grade_averages_on_course_group_id"
    t.index ["grading_period_id"], name: "index_course_group_grade_averages_on_grading_period_id"
  end

  create_table "course_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course_group_type"
    t.integer "capacity"
    t.string "image"
    t.text "policy"
    t.datetime "deleted_at"
    t.integer "order", default: 0
    t.index ["course_id"], name: "index_course_groups_on_course_id"
    t.index ["deleted_at"], name: "index_course_groups_on_deleted_at"
  end

  create_table "course_groups_daily_notes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_group_id"
    t.integer "daily_note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_group_id", "daily_note_id"], name: "cg_dn"
  end

  create_table "course_groups_quizzes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_group_id", null: false
    t.integer "quiz_id", null: false
    t.datetime "deleted_at"
    t.boolean "hide_grade", default: false
    t.boolean "select_all", default: true
    t.index ["course_group_id", "quiz_id"], name: "index_course_groups_quizzes_on_course_group_id_and_quiz_id"
    t.index ["deleted_at"], name: "index_course_groups_quizzes_on_deleted_at"
    t.index ["quiz_id", "course_group_id"], name: "index_course_groups_quizzes_on_quiz_id_and_course_group_id"
  end

  create_table "course_groups_students", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_group_id", null: false
    t.integer "student_id", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_course_groups_students_on_deleted_at"
  end

  create_table "course_groups_teachers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_group_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_course_groups_teachers_on_deleted_at"
  end

  create_table "course_groups_weekly_plans", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_group_id"
    t.integer "weekly_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_group_id"], name: "index_course_groups_weekly_plans_on_course_group_id"
    t.index ["weekly_plan_id"], name: "index_course_groups_weekly_plans_on_weekly_plan_id"
  end

  create_table "course_notes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "note", null: false
    t.string "title", null: false
    t.integer "course_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_course_notes_on_course_id"
    t.index ["deleted_at"], name: "index_course_notes_on_deleted_at"
    t.index ["user_id"], name: "index_course_notes_on_user_id"
  end

  create_table "course_users_accesses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
    t.string "accessible_type"
    t.integer "additional_action", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessible_type", "course_id", "user_id"], name: "index_c_u_acc_on_acc_type_and_course_id_and_user_id", unique: true
  end

  create_table "courses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_pool_id"
    t.string "code"
    t.string "checklist_string"
    t.integer "semester_id"
    t.integer "hod_id"
    t.integer "total_grade", default: 100
    t.integer "pass_limit", default: 50
    t.boolean "show_final_grade", default: false
    t.string "icon_name"
    t.integer "level_id"
    t.datetime "deleted_at"
    t.boolean "calculated_in_total", default: true, null: false
    t.boolean "hide", default: false, null: false
    t.integer "order", default: 0
    t.index ["deleted_at"], name: "index_courses_on_deleted_at"
    t.index ["hod_id"], name: "index_courses_on_hod_id"
    t.index ["level_id"], name: "index_courses_on_level_id"
    t.index ["semester_id"], name: "index_courses_on_semester_id"
  end

  create_table "courses_grading_periods", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "grading_period_id", null: false
    t.datetime "deleted_at"
    t.decimal "weight", precision: 5, scale: 2
    t.index ["course_id", "grading_period_id"], name: "index_courses_grading_periods_on_course_id_and_grading_period_id"
    t.index ["deleted_at"], name: "index_courses_grading_periods_on_deleted_at"
    t.index ["grading_period_id", "course_id"], name: "index_courses_grading_periods_on_grading_period_id_and_course_id"
  end

  create_table "courses_students", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.integer "guru", default: 0
    t.integer "grand_maester", default: 0
    t.datetime "deleted_at"
    t.index ["course_id", "student_id"], name: "index_courses_students_on_course_id_and_student_id"
    t.index ["deleted_at"], name: "index_courses_students_on_deleted_at"
    t.index ["student_id", "course_id"], name: "index_courses_students_on_student_id_and_course_id"
  end

  create_table "courses_subjects", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_id"], name: "index_courses_subjects_on_course_id"
    t.index ["subject_id"], name: "index_courses_subjects_on_subject_id"
  end

  create_table "courses_teachers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "deleted_at"
    t.index ["course_id", "teacher_id"], name: "course_has_teachers", unique: true
    t.index ["deleted_at"], name: "index_courses_teachers_on_deleted_at"
    t.index ["teacher_id", "course_id"], name: "index_courses_teachers_on_teacher_id_and_course_id"
  end

  create_table "courses_weekly_plans", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id"
    t.integer "weekly_plan_id"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_weekly_plans_on_course_id"
    t.index ["weekly_plan_id"], name: "index_courses_weekly_plans_on_weekly_plan_id"
  end

  create_table "created_content_items", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "text"
    t.integer "content_id"
    t.string "item_file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_published"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_created_content_items_on_deleted_at"
  end

  create_table "daily_notes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.text "class_work"
    t.text "homework"
    t.text "activities"
    t.date "date"
    t.integer "weekly_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_daily_notes_on_course_id"
    t.index ["date"], name: "index_daily_notes_on_date"
    t.index ["weekly_plan_id"], name: "index_daily_notes_on_weekly_plan_id"
  end

  create_table "discussion_comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "discussion_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_discussion_comments_on_deleted_at"
  end

  create_table "districts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["city_id"], name: "index_districts_on_city_id"
    t.index ["deleted_at"], name: "index_districts_on_deleted_at"
  end

  create_table "dragon_messages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "message"
    t.text "params"
    t.date "start_date"
    t.date "end_date"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_dragon_messages_on_deleted_at"
  end

  create_table "event_listeners", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "listener_id", null: false
    t.string "listener_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_event_listeners_on_deleted_at"
    t.index ["event_id"], name: "index_event_listeners_on_event_id"
    t.index ["listener_type", "listener_id"], name: "index_event_listeners_on_listener_type_and_listener_id"
  end

  create_table "events", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "type", default: 0
    t.text "description"
    t.string "title"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "all_day"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_events_on_deleted_at"
  end

  create_table "feature_flags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "user_id"
    t.integer "school_id"
    t.integer "feature_id"
    t.index ["deleted_at"], name: "index_feature_flags_on_deleted_at"
    t.index ["feature_id"], name: "index_feature_flags_on_feature_id"
    t.index ["school_id"], name: "index_feature_flags_on_school_id"
    t.index ["user_id"], name: "index_feature_flags_on_user_id"
  end

  create_table "features", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default_enabled"
    t.index ["key"], name: "index_features_on_key"
  end

  create_table "fedenas", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "host"
    t.string "redirect_uri"
    t.string "client_id"
    t.string "client_secret"
    t.string "username"
    t.string "password"
    t.string "grant_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_fedenas_on_deleted_at"
    t.index ["school_id"], name: "index_fedenas_on_school_id"
  end

  create_table "feedbacks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "content"
    t.integer "owner_id"
    t.integer "on_id", null: false
    t.string "on_type", null: false
    t.integer "to_id", null: false
    t.string "to_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_feedbacks_on_deleted_at"
    t.index ["on_type", "on_id"], name: "index_feedbacks_on_on_type_and_on_id"
    t.index ["to_type", "to_id"], name: "index_feedbacks_on_to_type_and_to_id"
  end

  create_table "front_end_exceptions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_front_end_exceptions_on_deleted_at"
  end

  create_table "general_grades", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "low"
    t.float "high"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "government_grade_report_grading_scales", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "government_grade_report_id"
    t.integer "grading_scale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["government_grade_report_id", "grading_scale_id"], name: "index_gv_gd_rep_gd_sc_on_gv_gd_rep_id_and_grading_sc_id"
  end

  create_table "government_grade_report_translations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "government_grade_report_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "academic_year"
    t.string "level_name"
    t.string "stage_name"
    t.string "authorized_curriculum"
    t.string "accredit"
    t.index ["government_grade_report_id"], name: "index_de3b4f4fe5dd1fce3ac96565d39534d23c269ea3"
    t.index ["locale"], name: "index_government_grade_report_translations_on_locale"
  end

  create_table "government_grade_reports", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "reportable_id"
    t.string "reportable_type"
    t.string "file"
    t.string "name"
    t.integer "creator_id"
    t.string "scale_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reportable_type", "reportable_id"], name: "index_gv_gd_rep_on_rep_type_and_rep_id"
  end

  create_table "grade_items", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "max_grade"
    t.integer "course_group_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "semester_id"
    t.integer "grading_period_id"
    t.datetime "deleted_at"
    t.boolean "hide_grade", default: false
    t.index ["category_id"], name: "index_grade_items_on_category_id"
    t.index ["course_group_id"], name: "index_grade_items_on_course_group_id"
    t.index ["deleted_at"], name: "index_grade_items_on_deleted_at"
    t.index ["grading_period_id"], name: "index_grade_items_on_grading_period_id"
  end

  create_table "grade_submissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.decimal "grade", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "grade_item_id"
    t.integer "course_id"
    t.text "feedback"
    t.datetime "deleted_at"
    t.integer "student_status", default: 0
    t.index ["course_id"], name: "index_grade_submissions_on_course_id"
    t.index ["deleted_at"], name: "index_grade_submissions_on_deleted_at"
    t.index ["grade_item_id"], name: "index_grade_submissions_on_grade_item_id"
    t.index ["student_id"], name: "index_grade_submissions_on_student_id"
  end

  create_table "grades", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "on_id", null: false
    t.string "on_type", null: false
    t.integer "to_id", null: false
    t.string "to_type", null: false
    t.integer "score", default: 0
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_grades_on_deleted_at"
    t.index ["on_type", "on_id"], name: "index_grades_on_on_type_and_on_id"
    t.index ["to_type", "to_id"], name: "index_grades_on_to_type_and_to_id"
  end

  create_table "grading_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "grading_system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_grading_categories_on_deleted_at"
    t.index ["grading_system_id"], name: "index_grading_categories_on_grading_system_id"
  end

  create_table "grading_periods", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
    t.integer "academic_term_id"
    t.datetime "deleted_at"
    t.decimal "weight", precision: 5, scale: 2
    t.integer "parent_id"
    t.boolean "lock", default: false
    t.boolean "publish", default: false
    t.index ["academic_term_id"], name: "index_grading_periods_on_academic_term_id"
    t.index ["deleted_at"], name: "index_grading_periods_on_deleted_at"
    t.index ["level_id"], name: "index_grading_periods_on_level_id"
  end

  create_table "grading_scales", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "grading_system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_grading_scales_on_deleted_at"
    t.index ["grading_system_id"], name: "index_grading_scales_on_grading_system_id"
  end

  create_table "grading_systems", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_grading_systems_on_deleted_at"
    t.index ["school_id"], name: "index_grading_systems_on_school_id"
  end

  create_table "group_contents", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_content_id"
    t.integer "course_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["course_content_id"], name: "index_group_contents_on_course_content_id"
    t.index ["course_group_id"], name: "index_group_contents_on_course_group_id"
    t.index ["deleted_at"], name: "index_group_contents_on_deleted_at"
  end

  create_table "grouping_students", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "assignable_id", null: false
    t.string "assignable_type", null: false
    t.integer "course_group_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assignable_id", "assignable_type", "course_group_id"], name: "assignable_course_group_fk"
  end

  create_table "history_categories_history_grading_periods", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "history_category_id"
    t.integer "history_grading_period_id"
    t.index ["history_category_id"], name: "index_history_cat"
    t.index ["history_grading_period_id"], name: "index_history_gp"
  end

  create_table "history_category_history_grading_period_students", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "history_categories_history_grading_periods_id"
    t.integer "student_id"
    t.float "grade", default: 0.0
    t.index ["history_categories_history_grading_periods_id"], name: "index_history_cat_history_gp"
    t.index ["student_id"], name: "index_histry_student_id"
  end

  create_table "history_course_comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.integer "course_comment_id"
    t.string "comment_key"
    t.index ["course_comment_id"], name: "index_history_course_comments_on_course_comment_id"
    t.index ["course_id"], name: "index_history_course_comments_on_course_id"
    t.index ["student_id"], name: "index_history_course_comments_on_student_id"
  end

  create_table "history_grading_period_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.float "weighted_total", default: 0.0
    t.float "weight", default: 0.0
    t.integer "parent_id"
    t.integer "item_id"
    t.integer "academic_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_history_grading_period_categories_on_academic_year_id"
    t.index ["item_id"], name: "index_history_grading_period_categories_on_item_id"
    t.index ["parent_id"], name: "index_history_grading_period_categories_on_parent_id"
  end

  create_table "history_grading_period_category_submissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "history_grading_period_category_id"
    t.integer "history_submission_id"
    t.integer "course_id"
    t.string "course_name"
    t.integer "course_total"
    t.boolean "calculated_in_total"
    t.boolean "hide"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_history_grading_period_category_submissions_on_course_id"
    t.index ["course_name"], name: "index_history_grading_period_category_submissions_on_course_name"
    t.index ["history_grading_period_category_id"], name: "index_history_gp_cat_submissions_on_history_gp_cat_id"
    t.index ["history_submission_id"], name: "index_history_gp_cat_submissions_on_history_submissions"
  end

  create_table "history_submissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.float "grade", default: 0.0
    t.float "total", default: 0.0
    t.integer "student_id"
    t.integer "item_id"
    t.integer "academic_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_history_submissions_on_academic_year_id"
    t.index ["item_id"], name: "index_history_submissions_on_item_id"
    t.index ["student_id"], name: "index_history_submissions_on_student_id"
  end

  create_table "hods", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hod_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_hods_on_deleted_at"
    t.index ["hod_id"], name: "index_hods_on_hod_id"
  end

  create_table "lesson_objectives", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_plan_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lesson_objectives_on_deleted_at"
    t.index ["lesson_plan_id"], name: "index_lesson_objectives_on_lesson_plan_id"
  end

  create_table "lesson_plan_items", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "category"
    t.text "description"
    t.string "url"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_plan_id"
    t.datetime "deleted_at"
    t.integer "uploaded_file_id"
    t.index ["deleted_at"], name: "index_lesson_plan_items_on_deleted_at"
    t.index ["lesson_plan_id"], name: "index_lesson_plan_items_on_lesson_plan_id"
  end

  create_table "lesson_plans", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "subject"
    t.integer "duration"
    t.datetime "date"
    t.string "helping_tools"
    t.string "suggested_education_ways"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id"
    t.integer "level_id"
    t.integer "lesson_id"
    t.datetime "deleted_at"
    t.string "name"
    t.integer "course_group_id"
    t.integer "slot_no"
    t.string "file"
    t.index ["course_group_id"], name: "index_lesson_plans_on_course_group_id"
    t.index ["deleted_at"], name: "index_lesson_plans_on_deleted_at"
    t.index ["lesson_id"], name: "index_lesson_plans_on_lesson_id"
    t.index ["level_id"], name: "index_lesson_plans_on_level_id"
    t.index ["teacher_id"], name: "index_lesson_plans_on_teacher_id"
  end

  create_table "lessons", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "unit_id"
    t.text "description"
    t.date "date"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lessons_on_deleted_at"
    t.index ["unit_id"], name: "index_lessons_on_unit_id"
  end

  create_table "levels", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_type"
    t.integer "slots_count", default: 9
    t.string "level_code", default: "0"
    t.string "grading_type"
    t.datetime "deleted_at"
    t.integer "academic_term_id"
    t.index ["academic_term_id"], name: "index_levels_on_academic_term_id"
    t.index ["deleted_at"], name: "index_levels_on_deleted_at"
    t.index ["level_code"], name: "index_levels_on_level_code"
    t.index ["stage_id"], name: "index_levels_on_stage_id"
  end

  create_table "levels_teachers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "level_id", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_levels_teachers_on_deleted_at"
    t.index ["level_id", "teacher_id"], name: "index_levels_teachers_on_level_id_and_teacher_id"
  end

  create_table "message_thread_participants", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "thread_id"
    t.integer "user_id"
    t.datetime "last_seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted", default: false
    t.boolean "is_read", default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_message_thread_participants_on_deleted_at"
  end

  create_table "message_threads", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "creator_id"
    t.datetime "last_added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag", null: false
    t.integer "course_id"
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_message_threads_on_course_id"
    t.index ["deleted_at"], name: "index_message_threads_on_deleted_at"
  end

  create_table "messages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "body"
    t.integer "thread_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.string "filename"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_messages_on_deleted_at"
  end

  create_table "notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.text "message"
    t.boolean "seen", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo", default: "notifications"
    t.text "params"
    t.datetime "deleted_at"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.index ["deleted_at"], name: "index_notifications_on_deleted_at"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
  end

  create_table "objectives", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "lesson_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_objectives_on_deleted_at"
    t.index ["lesson_id"], name: "index_objectives_on_lesson_id"
  end

  create_table "objectives_quizzes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "objective_id", null: false
    t.integer "quiz_id", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_objectives_quizzes_on_deleted_at"
    t.index ["objective_id", "quiz_id"], name: "index_objectives_quizzes_on_objective_id_and_quiz_id"
    t.index ["quiz_id", "objective_id"], name: "index_objectives_quizzes_on_quiz_id_and_objective_id"
  end

  create_table "parents", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_parents_on_deleted_at"
  end

  create_table "pass_limits", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.float "total_grade"
    t.float "pass_limit"
    t.integer "grading_system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_pass_limits_on_deleted_at"
    t.index ["grading_system_id"], name: "index_pass_limits_on_grading_system_id"
  end

  create_table "permission_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_permission_categories_on_name"
  end

  create_table "permission_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "system", default: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "names", limit: 2000, default: "--- []\n"
    t.string "entity"
    t.string "actions", limit: 2000, default: "--- []\n"
    t.integer "permission_category_id"
    t.integer "level"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity", "level"], name: "index_permissions_on_entity_and_level"
    t.index ["entity"], name: "index_permissions_on_entity"
    t.index ["level"], name: "index_permissions_on_level"
    t.index ["permission_category_id"], name: "index_permissions_on_permission_category_id"
  end

  create_table "permissions_permission_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "permission_id"
    t.integer "permission_group_id"
    t.index ["permission_id", "permission_group_id"], name: "index_permission_permission_group_id"
  end

  create_table "posts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "content"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "postable_id"
    t.string "postable_type"
    t.string "video_preview"
    t.datetime "deleted_at"
    t.string "filename"
    t.string "attachment"
    t.index ["deleted_at"], name: "index_posts_on_deleted_at"
    t.index ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id", length: { postable_type: 191 }
  end

  create_table "prerequisites", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "course_id"
    t.integer "prerequisite_id"
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_prerequisites_on_course_id"
    t.index ["deleted_at"], name: "index_prerequisites_on_deleted_at"
    t.index ["prerequisite_id"], name: "index_prerequisites_on_prerequisite_id"
  end

  create_table "progress_report_domain_competencies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.integer "progress_report_domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progress_report_domain_id"], name: "index_p_r_d_competencies_on_p_r_d_id"
  end

  create_table "progress_report_domains", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progress_report_evaluation_criteria", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progress_report_selected_domain_competencies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "progress_report_id"
    t.integer "progress_report_domain_competency_id"
    t.integer "progress_report_evaluation_criterium_id"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progress_report_domain_competency_id"], name: "index_p_r_s_d_c_on_p_r_d_c_id"
    t.index ["progress_report_evaluation_criterium_id"], name: "index_p_r_s_d_c_on_p_r_e_c_id"
    t.index ["progress_report_id"], name: "index_p_r_s_domain_competencies_on_p_r_id"
  end

  create_table "progress_report_selected_domains", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "progress_report_id"
    t.integer "progress_report_domain_id"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progress_report_domain_id"], name: "index_progress_report_domains_on_progress_report"
    t.index ["progress_report_id"], name: "index_progress_report_selected_domains_on_progress_report_id"
  end

  create_table "progress_report_selected_evaluation_criteria", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "progress_report_id"
    t.integer "progress_report_evaluation_criterium_id"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progress_report_evaluation_criterium_id"], name: "index_p_r_s_e_c_on_p_r_s_e_c_id"
    t.index ["progress_report_id"], name: "index_p_r_s_e_c_on_p_r_id"
  end

  create_table "progress_reports", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "level_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_progress_reports_on_level_id"
  end

  create_table "published_content_scopes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_published_content_scopes_on_deleted_at"
  end

  create_table "published_contents", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "scope_id"
    t.integer "entity_id"
    t.integer "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_published_contents_on_deleted_at"
  end

  create_table "qb_answers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "qb_question_id"
    t.boolean "is_correct"
    t.text "body"
    t.string "match"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_qb_answers_on_deleted_at"
  end

  create_table "qb_questions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "topic_id"
    t.integer "question_bank_id"
    t.string "correction_style"
    t.string "bloom"
    t.string "type"
    t.string "difficulty"
    t.float "score"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "teacher_id"
    t.index ["deleted_at"], name: "index_qb_questions_on_deleted_at"
    t.index ["teacher_id"], name: "index_qb_questions_on_teacher_id"
  end

  create_table "question_banks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_question_banks_on_deleted_at"
  end

  create_table "question_pools", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_question_pools_on_course_id"
    t.index ["deleted_at"], name: "index_question_pools_on_deleted_at"
  end

  create_table "question_submissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "body"
    t.integer "question_id"
    t.integer "answer_id"
    t.integer "submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_submission_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_question_submissions_on_deleted_at"
    t.index ["quiz_submission_id"], name: "index_question_submissions_on_quiz_submission_id"
  end

  create_table "questions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "body"
    t.float "score", null: false
    t.string "difficulty"
    t.string "type"
    t.integer "question_pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_id"
    t.string "bloom"
    t.integer "correction_style"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_questions_on_deleted_at"
    t.index ["question_pool_id"], name: "index_questions_on_question_pool_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quiz_submissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "score"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_id"
    t.integer "course_group_id"
    t.text "feedback"
    t.boolean "is_submitted", default: false
    t.datetime "deleted_at"
    t.integer "student_status", default: 0
    t.index ["course_group_id"], name: "index_quiz_submissions_on_course_group_id"
    t.index ["deleted_at"], name: "index_quiz_submissions_on_deleted_at"
    t.index ["quiz_id", "student_id"], name: "index_quiz_submissions_on_quiz_id_and_student_id"
    t.index ["quiz_id"], name: "index_quiz_submissions_on_quiz_id"
    t.index ["student_id"], name: "index_quiz_submissions_on_student_id"
  end

  create_table "quizzes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "objective"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_questions_randomized", default: false
    t.integer "lesson_id"
    t.integer "state", default: 1
    t.float "total_score"
    t.integer "teacher_id"
    t.integer "course_id"
    t.integer "category_id"
    t.integer "duration", null: false
    t.integer "num_of_questions_per_page", default: 5, null: false
    t.datetime "deleted_at"
    t.integer "grading_period_id"
    t.text "selected_student_ids"
    t.index ["category_id"], name: "index_quizzes_on_category_id"
    t.index ["course_id"], name: "index_quizzes_on_course_id"
    t.index ["end_date"], name: "index_quizzes_on_end_date"
    t.index ["grading_period_id"], name: "index_quizzes_on_grading_period_id"
    t.index ["lesson_id"], name: "index_quizzes_on_lesson_id"
    t.index ["teacher_id"], name: "index_quizzes_on_teacher_id"
  end

  create_table "report_cards", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.string "grading_period_name"
    t.string "reportable_type"
    t.integer "reportable_id"
    t.integer "creator_id"
    t.text "categories_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grade_type", default: 0
    t.boolean "show_grading_period", default: true
    t.boolean "show_comment", default: true
    t.text "scaled_numeric_categories"
    t.text "settings"
    t.text "grading_periods_settings"
    t.date "issued_date"
    t.string "paper_size", default: "A4"
    t.integer "template_type", default: 0
  end

  create_table "roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
  end

  create_table "salespeople", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_salespeople_on_deleted_at"
  end

  create_table "scale_grades", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "high"
    t.float "low"
    t.string "grade"
    t.integer "scale_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_scale_grades_on_deleted_at"
    t.index ["scale_id"], name: "index_scale_grades_on_scale_id"
  end

  create_table "scales", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.integer "grading_scale_id"
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_scales_on_course_id"
    t.index ["deleted_at"], name: "index_scales_on_deleted_at"
    t.index ["grading_scale_id"], name: "index_scales_on_grading_scale_id"
    t.index ["teacher_id"], name: "index_scales_on_teacher_id"
  end

  create_table "school_translations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "school_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "secondary_address"
    t.string "id_number"
    t.string "license_no"
    t.index ["locale"], name: "index_school_translations_on_locale"
    t.index ["school_id"], name: "index_school_translations_on_school_id"
  end

  create_table "school_units", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "floor"
    t.string "unit_type"
    t.boolean "is_deleted", default: false
    t.integer "enrollment_type"
    t.integer "num_of_students"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_school_units_on_deleted_at"
  end

  create_table "school_units_sections", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "school_unit_id", null: false
    t.integer "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_school_units_sections_on_deleted_at"
  end

  create_table "schools", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "school_description"
    t.string "academic_year"
    t.string "avatar"
    t.text "school_unit_types"
    t.text "config"
    t.string "code"
    t.string "url"
    t.datetime "deleted_at"
    t.string "ga_tracking_id"
    t.boolean "fedena_enabled", default: true
    t.string "phone"
    t.string "secondary_phone"
    t.string "fax"
    t.string "website"
    t.string "post_office_box"
    t.integer "students_max_no"
    t.string "email"
    t.string "parent_sheet"
    t.string "timezone", default: "Afirca/Cairo"
    t.datetime "next_payment_due_date"
    t.string "payment_amount"
    t.text "sales_contacts"
    t.index ["deleted_at"], name: "index_schools_on_deleted_at"
  end

  create_table "schools_users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "school_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_schools_users_on_deleted_at"
    t.index ["school_id"], name: "index_schools_users_on_school_id"
    t.index ["user_id"], name: "index_schools_users_on_user_id"
  end

  create_table "sections", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_sections_on_deleted_at"
    t.index ["school_id"], name: "index_sections_on_school_id"
  end

  create_table "sections_teachers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_sections_teachers_on_deleted_at"
    t.index ["section_id", "teacher_id"], name: "index_sections_teachers_on_section_id_and_teacher_id"
    t.index ["teacher_id", "section_id"], name: "index_sections_teachers_on_teacher_id_and_section_id"
  end

  create_table "semesters", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_semesters_on_deleted_at"
    t.index ["level_id"], name: "index_semesters_on_level_id"
  end

  create_table "social_advisors", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_social_advisors_on_deleted_at"
  end

  create_table "stages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted", default: false
    t.datetime "deleted_at"
    t.boolean "is_preschool", default: false
    t.index ["deleted_at"], name: "index_stages_on_deleted_at"
    t.index ["section_id"], name: "index_stages_on_section_id"
  end

  create_table "stages_teachers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "stage_id", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_stages_teachers_on_deleted_at"
    t.index ["stage_id", "teacher_id"], name: "index_stages_teachers_on_stage_id_and_teacher_id"
  end

  create_table "student_badges", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "student_id"
    t.integer "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.datetime "deleted_at"
    t.integer "academic_year_id"
    t.integer "guru", default: 0
    t.integer "grand_maester", default: 0
    t.index ["academic_year_id"], name: "index_student_badges_on_academic_year_id"
    t.index ["badge_id"], name: "index_student_badges_on_badge_id"
    t.index ["course_id"], name: "index_student_badges_on_course_id"
    t.index ["deleted_at"], name: "index_student_badges_on_deleted_at"
    t.index ["student_id"], name: "index_student_badges_on_student_id"
  end

  create_table "student_course_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.boolean "in_hall_of_fame", default: false
    t.integer "student_id"
    t.integer "course_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "course_comment_id"
    t.index ["course_comment_id"], name: "index_student_course_groups_on_course_comment_id"
    t.index ["course_group_id"], name: "index_student_course_groups_on_course_group_id"
    t.index ["deleted_at"], name: "index_student_course_groups_on_deleted_at"
    t.index ["student_id"], name: "index_student_course_groups_on_student_id"
  end

  create_table "student_progress_report_competencies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "student_progress_report_id"
    t.integer "progress_report_domain_competency_id"
    t.integer "progress_report_evaluation_criterium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_progress_report_id", "progress_report_domain_competency_id"], name: "index_s_p_r_c_on_s_p_r_and_p_r_d_c", unique: true
  end

  create_table "student_progress_reports", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "student_id"
    t.integer "progress_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progress_report_id"], name: "index_student_progress_reports_on_progress_report_id"
    t.index ["student_id"], name: "index_student_progress_reports_on_student_id"
  end

  create_table "student_submitted_assignments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "grade", default: 0.0
    t.boolean "graded", default: false
    t.integer "assignment_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "answers"
    t.string "file"
    t.text "feedback"
    t.integer "course_group_id"
    t.integer "downloads_number", default: 0
    t.datetime "deleted_at"
    t.integer "student_status", default: 0
    t.index ["assignment_id", "student_id"], name: "idx_st_sub_assi_on_assi_id_and_st_id"
    t.index ["assignment_id"], name: "index_student_submitted_assignments_on_assignment_id"
    t.index ["course_group_id"], name: "index_student_submitted_assignments_on_course_group_id"
    t.index ["deleted_at"], name: "index_student_submitted_assignments_on_deleted_at"
    t.index ["student_id"], name: "index_student_submitted_assignments_on_student_id"
  end

  create_table "students", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
    t.integer "section_id"
    t.string "reference_id"
    t.integer "parent_id"
    t.integer "bedo_points", default: 0
    t.integer "stage_id"
    t.string "code"
    t.string "batch_name"
    t.string "immediate_contact"
    t.datetime "deleted_at"
    t.boolean "show_grades", default: true
    t.string "passport_no"
    t.string "iqama_no"
    t.date "date_of_admission"
    t.date "date_of_leaving"
    t.string "previous_school"
    t.string "section_name"
    t.index ["deleted_at"], name: "index_students_on_deleted_at"
    t.index ["parent_id"], name: "index_students_on_parent_id"
    t.index ["section_id"], name: "index_students_on_section_id"
    t.index ["stage_id"], name: "index_students_on_stage_id"
  end

  create_table "sub_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_sub_categories_on_deleted_at"
  end

  create_table "subject_hods", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "hod_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_subject_hods_on_deleted_at"
  end

  create_table "subjects", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.datetime "deleted_at"
    t.string "code"
    t.index ["code"], name: "index_subjects_on_code"
    t.index ["deleted_at"], name: "index_subjects_on_deleted_at"
  end

  create_table "subscriptions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "subscribable_id", null: false
    t.string "subscribable_type", null: false
    t.integer "subscriber_id", null: false
    t.string "subscriber_type", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_subscriptions_on_deleted_at"
    t.index ["subscribable_id", "subscribable_type"], name: "index_subscriptions_on_subscribable_id_and_subscribable_type"
    t.index ["subscriber_id", "subscriber_type"], name: "index_subscriptions_on_subscriber_id_and_subscriber_type"
  end

  create_table "super_admins", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_super_admins_on_deleted_at"
  end

  create_table "syllabuses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_syllabuses_on_deleted_at"
  end

  create_table "sync_stats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "process_type"
    t.string "student_addmission_no"
    t.integer "parent_student_id"
    t.string "teacher_number"
    t.string "hod_number"
    t.string "batch_name"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_sync_stats_on_deleted_at"
  end

  create_table "teachers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_teachers_on_deleted_at"
  end

  create_table "teaching_methods", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "name"
    t.integer "lesson_plan_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_plan_id"], name: "index_teaching_methods_on_lesson_plan_id"
  end

  create_table "temp_tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "token"
    t.string "path"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_temp_tokens_on_deleted_at"
  end

  create_table "test_models", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "title"
    t.string "description"
    t.integer "price"
    t.integer "assignable_id"
    t.string "assignable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_id", "assignable_type"], name: "index_test_models_on_assignable_id_and_assignable_type"
    t.index ["price"], name: "index_test_models_on_price"
  end

  create_table "timetable_slots", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "day"
    t.integer "slot_no"
    t.integer "course_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
    t.integer "section_id"
    t.integer "school_unit_id"
    t.datetime "from"
    t.datetime "to"
    t.datetime "deleted_at"
    t.index ["course_group_id"], name: "index_timetable_slots_on_course_group_id"
    t.index ["deleted_at"], name: "index_timetable_slots_on_deleted_at"
    t.index ["level_id"], name: "index_timetable_slots_on_level_id"
    t.index ["section_id"], name: "index_timetable_slots_on_section_id"
  end

  create_table "to_dos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.boolean "done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_to_dos_on_deleted_at"
  end

  create_table "topics", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_topics_on_deleted_at"
  end

  create_table "twenty_one_century_skills", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_plan_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_twenty_one_century_skills_on_deleted_at"
    t.index ["lesson_plan_id"], name: "index_twenty_one_century_skills_on_lesson_plan_id"
  end

  create_table "units", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "chapter_id"
    t.text "description"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["chapter_id"], name: "index_units_on_chapter_id"
    t.index ["deleted_at"], name: "index_units_on_deleted_at"
  end

  create_table "uploaded_files", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "file"
    t.string "content_type"
    t.string "name"
    t.string "description"
    t.integer "file_size"
    t.integer "downloads_number", default: 0
    t.integer "fileable_id"
    t.string "fileable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "upload_type", default: 0
    t.integer "creator_id"
    t.index ["deleted_at"], name: "index_uploaded_files_on_deleted_at"
  end

  create_table "user_translations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "nationality"
    t.string "place_of_birth"
    t.index ["locale"], name: "index_user_translations_on_locale"
    t.index ["user_id"], name: "index_user_translations_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "middlename"
    t.string "title"
    t.date "dateofbirth"
    t.string "gender"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_type"
    t.string "avatar"
    t.text "bio"
    t.string "postal_address"
    t.string "phone"
    t.string "mobile"
    t.string "facebook"
    t.string "twitter"
    t.string "blog"
    t.boolean "show_my_birthdate"
    t.boolean "approved", default: false, null: false
    t.integer "role_id"
    t.string "username"
    t.string "locale", default: "en"
    t.string "country"
    t.string "city"
    t.string "home_address"
    t.boolean "is_active", default: true
    t.integer "actable_id"
    t.string "actable_type"
    t.string "name"
    t.string "secondary_phone"
    t.string "secondary_address"
    t.text "about_me"
    t.string "mobile_device_token"
    t.integer "unseen_notifications", default: 0
    t.datetime "deleted_at"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.boolean "password_changed", default: false
    t.index ["actable_id", "actable_type", "is_active"], name: "index_users_on_actable_id_and_actable_type_and_is_active"
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["uid", "provider", "deleted_at"], name: "index_users_on_uid_and_provider_and_deleted_at", unique: true
  end

  create_table "users_permission_groups", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_group_id"
    t.index ["user_id", "permission_group_id"], name: "index_users_permission_groups_on_user_id_and_permission_group_id"
  end

  create_table "users_permissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_id"
    t.index ["user_id", "permission_id"], name: "index_users_permissions_on_user_id_and_permission_id"
  end

  create_table "versions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", size: :long
    t.string "user_ip"
    t.integer "level_id"
    t.datetime "created_at"
    t.text "object_changes", size: :long
    t.string "whodunnit_type"
    t.integer "course_id"
    t.boolean "is_sign_in"
    t.index ["course_id", "level_id"], name: "index_versions_on_course_id_and_level_id"
    t.index ["event"], name: "index_versions_on_event"
    t.index ["is_sign_in"], name: "index_versions_on_is_sign_in"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["whodunnit_type"], name: "index_versions_on_whodunnit_type"
  end

  create_table "virtual_classrooms", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_group_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_virtual_classrooms_on_deleted_at"
  end

  create_table "weekly_notes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "weekly_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["weekly_plan_id"], name: "index_weekly_notes_on_weekly_plan_id"
  end

  create_table "weekly_plans", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "level_id"
    t.integer "state", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_weekly_plans_on_deleted_at"
    t.index ["end_date"], name: "index_weekly_plans_on_end_date"
    t.index ["level_id"], name: "index_weekly_plans_on_level_id"
    t.index ["start_date"], name: "index_weekly_plans_on_start_date"
    t.index ["state"], name: "index_weekly_plans_on_state"
  end

  create_table "zones", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0
    t.integer "files_count", default: 0
    t.integer "events_count", default: 0
    t.integer "members_count", default: 0
    t.datetime "deleted_at"
    t.index ["creator_id"], name: "index_zones_on_creator_id"
    t.index ["deleted_at"], name: "index_zones_on_deleted_at"
  end

  create_table "zones_users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "zone_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_zones_users_on_deleted_at"
    t.index ["user_id"], name: "index_zones_users_on_user_id"
    t.index ["zone_id"], name: "index_zones_users_on_zone_id"
  end

  add_foreign_key "academic_terms", "grading_systems"
  add_foreign_key "announcement_receivers", "announcements"
  add_foreign_key "answer_submissions", "quiz_submissions"
  add_foreign_key "assignments", "categories"
  add_foreign_key "assignments", "chapters"
  add_foreign_key "assignments", "courses"
  add_foreign_key "assignments", "grading_periods"
  add_foreign_key "behavior_note_categories", "schools"
  add_foreign_key "behavior_note_receivers", "behavior_notes"
  add_foreign_key "behavior_notes", "course_groups"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "categories", "grading_categories"
  add_foreign_key "courses", "levels"
  add_foreign_key "fedenas", "schools"
  add_foreign_key "grade_items", "categories"
  add_foreign_key "grade_items", "course_groups"
  add_foreign_key "grade_items", "grading_periods"
  add_foreign_key "grading_categories", "grading_systems"
  add_foreign_key "grading_periods", "academic_terms"
  add_foreign_key "grading_periods", "levels"
  add_foreign_key "grading_scales", "grading_systems"
  add_foreign_key "grading_systems", "schools"
  add_foreign_key "history_grading_period_category_submissions", "history_grading_period_categories"
  add_foreign_key "history_grading_period_category_submissions", "history_submissions"
  add_foreign_key "lesson_objectives", "lesson_plans"
  add_foreign_key "lesson_plan_items", "lesson_plans"
  add_foreign_key "lesson_plans", "lessons"
  add_foreign_key "lesson_plans", "levels"
  add_foreign_key "lesson_plans", "teachers", on_delete: :nullify
  add_foreign_key "levels", "academic_terms"
  add_foreign_key "levels", "stages"
  add_foreign_key "objectives", "lessons"
  add_foreign_key "pass_limits", "grading_systems"
  add_foreign_key "permissions", "permission_categories"
  add_foreign_key "qb_questions", "teachers"
  add_foreign_key "quiz_submissions", "course_groups"
  add_foreign_key "quizzes", "grading_periods"
  add_foreign_key "scale_grades", "scales"
  add_foreign_key "scales", "grading_scales"
  add_foreign_key "sections", "schools"
  add_foreign_key "stages", "sections"
  add_foreign_key "student_submitted_assignments", "course_groups"
  add_foreign_key "timetable_slots", "course_groups"
  add_foreign_key "users", "roles"
end
