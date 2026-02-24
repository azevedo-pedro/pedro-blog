class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    enable_extension "unaccent" unless extension_enabled?("unaccent")

    create_table :posts do |t|
      t.string   :title,            null: false
      t.string   :description,      null: false
      t.text     :body,             null: false
      t.text     :body_html
      t.datetime :published_at,     null: false
      t.string   :category,         null: false
      t.string   :background_color, null: false, default: "#637a91"
      t.string   :thumbnail_url
      t.string   :slug,             null: false
      t.integer  :reading_time_minutes
      t.boolean  :published,        null: false, default: true
      t.timestamps
    end

    add_index :posts, :slug, unique: true
    add_index :posts, :published_at
  end
end
