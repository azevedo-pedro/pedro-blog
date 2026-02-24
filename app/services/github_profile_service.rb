# frozen_string_literal: true

require "net/http"
require "json"

class GithubProfileService
  GITHUB_USERNAME = "azevedo-pedro"
  API_URL         = "https://api.github.com/users/#{GITHUB_USERNAME}".freeze
  CACHE_KEY       = "github_profile/#{GITHUB_USERNAME}".freeze
  CACHE_TTL       = 6.hours
  REQUEST_TIMEOUT = 5 # seconds

  DEFAULTS = {
    name:       "Pedro Azevedo",
    company:    "Deal",
    avatar_url: nil,
    bio:        nil
  }.freeze

  def self.call
    new.fetch
  end

  def fetch
    Rails.cache.fetch(CACHE_KEY, expires_in: CACHE_TTL) { fetch_from_api }
  rescue => e
    Rails.logger.warn("[GithubProfileService] Cache/fetch error: #{e.message}")
    DEFAULTS
  end

  private

  def fetch_from_api
    uri = URI(API_URL)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true,
                               open_timeout: REQUEST_TIMEOUT,
                               read_timeout: REQUEST_TIMEOUT) do |http|
      req = Net::HTTP::Get.new(uri)
      req["Accept"]     = "application/vnd.github+json"
      req["User-Agent"] = "pedro-blog/1.0"
      http.request(req)
    end

    response.is_a?(Net::HTTPSuccess) ? parse(response.body) : DEFAULTS
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    Rails.logger.warn("[GithubProfileService] Network error: #{e.message}")
    DEFAULTS
  end

  def parse(body)
    data = JSON.parse(body, symbolize_names: true)
    {
      name:       data[:name].presence       || DEFAULTS[:name],
      company:    data[:company].presence    || DEFAULTS[:company],
      avatar_url: data[:avatar_url].presence,
      bio:        data[:bio].presence
    }
  rescue JSON::ParserError => e
    Rails.logger.warn("[GithubProfileService] JSON parse error: #{e.message}")
    DEFAULTS
  end
end
