class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_default_meta_tags

  private

  def set_default_meta_tags
    set_meta_tags(
      site: "Pedro Azevedo",
      title: "Blog",
      separator: "|",
      description: "Um blog sobre desenvolvimento web, Ruby on Rails e tecnologia.",
      og: {
        site_name: "Pedro Azevedo",
        type: "website"
      }
    )
  end
end
