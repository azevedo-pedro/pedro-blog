# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  include PgSearch::Model

  friendly_id :title, use: :slugged

  has_one_attached :thumbnail_image

  pg_search_scope :search_full_text,
    against: {
      title: "A",
      description: "B",
      body: "C"
    },
    using: {
      tsearch: {
        dictionary: "portuguese",
        tsvector_column: nil
      }
    }

  scope :published, -> { where(published: true) }
  scope :recent, -> { order(published_at: :desc) }
  scope :by_category, ->(cat) { where(category: cat) }

  validates :title, :description, :body, :published_at, :category, presence: true

  before_save :calculate_reading_time
  before_save :render_body_to_html

  def previous_post
    Post.published
        .where("published_at < ?", published_at)
        .order(published_at: :desc)
        .first
  end

  def next_post
    Post.published
        .where("published_at > ?", published_at)
        .order(published_at: :asc)
        .first
  end

  private

  def calculate_reading_time
    word_count = body.to_s.split.length
    self.reading_time_minutes = [ (word_count / 200.0).ceil, 1 ].max
  end

  def render_body_to_html
    self.body_html = MarkdownRenderer.call(body)
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
