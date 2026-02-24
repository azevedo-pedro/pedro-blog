# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    layout "admin"
  end
end
