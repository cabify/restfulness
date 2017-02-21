
require 'uri'
require 'multi_json'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'active_support/logger'
require 'rack'

require 'http_accept_language/parser'

require "restfulness/http_authentication/basic"

require "restfulness/resources/events"
require "restfulness/resources/authentication"

require "restfulness/requests/authorization"
require "restfulness/requests/authorization_header"

require "restfulness/headers/media_type"
require "restfulness/headers/accept"

require "restfulness/application"
require "restfulness/dispatcher"
require "restfulness/exceptions"
require "restfulness/path"
require "restfulness/request"
require "restfulness/resource"
require "restfulness/response"
require "restfulness/route"
require "restfulness/router"
require "restfulness/sanitizer"
require "restfulness/statuses"
require "restfulness/version"

require "restfulness/dispatchers/rack"

module Restfulness
  extend self

  attr_accessor :logger

  # Determine which parameters keys should be filtered in logs, etc
  def sensitive_params=(params)
    @sensitive_params = params
  end

  def sensitive_params
    @sensitive_params ||= [:password]
  end
end

Restfulness.logger = ActiveSupport::Logger.new(STDOUT)

