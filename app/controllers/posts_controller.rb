# frozen_string_literal: true

class PostsController < ApplicationController
  include Pagy::Backend

  def index
    posts_scope = Post.published.recent
    posts_scope = posts_scope.by_category(params[:cat]) if params[:cat].present?
    @pagy, @posts = pagy(posts_scope, limit: 6)
    @categories = Post.published.distinct.pluck(:category).sort
  end

  def show
    @post = Post.friendly.find(params[:id])
    @previous_post = @post.previous_post
    @next_post = @post.next_post

    set_meta_tags(
      title: @post.title,
      description: @post.description,
      og: {
        title: @post.title,
        description: @post.description,
        image: @post.thumbnail_url,
        type: "article"
      },
      twitter: {
        card: "summary_large_image",
        title: @post.title,
        description: @post.description,
        image: @post.thumbnail_url
      }
    )
  end

  def search
    @query = params[:q].to_s.strip
    @posts = @query.present? ? Post.published.search_full_text(@query) : Post.none
  end
end
