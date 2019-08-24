class CreateVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :versions do |t|
      t.string :item_type,       limit: 255,        null: false
      t.integer :item_id,        limit: 4,          null: false
      t.string :event,           limit: 255,        null: false
      t.string :whodunnit,       limit: 255
      t.text   :object,          limit: 4294967295
      t.string :user_ip,         limit: 255
      t.integer :level_id,       limit: 4
      t.text   :object_changes,  limit: 4294967295
      t.string :whodunnit_type,  limit: 255
      t.integer :course_id,      limit: 4
      t.boolean :is_sign_in
      t.timestamps
    end
  end
end
