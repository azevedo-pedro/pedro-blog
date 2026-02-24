# frozen_string_literal: true

require "yaml"

namespace :blog do
  desc "Import markdown posts from the Gatsby blog"
  task import: :environment do
    posts_dir = ENV.fetch("POSTS_DIR", "/Users/azevedo/Developer/github/my-personal-blog/posts")
    pattern = File.join(posts_dir, "*.md")
    files = Dir.glob(pattern).sort

    if files.empty?
      puts "No .md files found in #{posts_dir}"
      next
    end

    puts "Found #{files.count} post(s) to import..."
    imported = 0
    skipped = 0

    files.each do |file_path|
      filename = File.basename(file_path, ".md")

      # Derive slug: strip leading date prefix (YYYY-MM-DD-)
      slug = filename.sub(/\A\d{4}-\d{2}-\d{2}-/, "")

      if Post.exists?(slug: slug)
        puts "  Skipping (already exists): #{slug}"
        skipped += 1
        next
      end

      content = File.read(file_path, encoding: "utf-8")

      # Split frontmatter and body
      if content =~ /\A---\s*\n(.*?)\n---\s*\n(.*)\z/m
        frontmatter_str = $1
        body = $2.strip
      else
        puts "  Skipping (no frontmatter): #{filename}"
        skipped += 1
        next
      end

      begin
        fm = YAML.safe_load(frontmatter_str, permitted_classes: [ Date, Time ])
      rescue Psych::Exception => e
        puts "  Skipping (YAML error in #{filename}): #{e.message}"
        skipped += 1
        next
      end

      title = fm["title"].to_s.strip
      description = fm["description"].to_s.strip
      category = fm["category"].to_s.strip.downcase
      background_color = fm["background"].to_s.strip
      thumbnail_url = fm["thumbnail"].to_s.strip

      raw_date = fm["date"]
      published_at = case raw_date
      when Time, DateTime then raw_date
      when Date then raw_date.to_time
      when String then Time.parse(raw_date) rescue Time.current
      else Time.current
      end

      post = Post.new(
        title: title.presence || filename,
        description: description.presence || title,
        body: body,
        published_at: published_at,
        category: category.presence || "dev",
        background_color: background_color.presence || "#637a91",
        thumbnail_url: thumbnail_url.presence,
        slug: slug,
        published: true
      )

      if post.save
        puts "  Imported: #{post.title} (#{slug})"
        imported += 1
      else
        puts "  Failed #{filename}: #{post.errors.full_messages.join(', ')}"
        skipped += 1
      end
    end

    puts "\nDone! Imported: #{imported}, Skipped: #{skipped}"
  end
end
