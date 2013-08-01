module Rack
  module OAuth2
    class Server

      class ActiveRecord < ::ActiveRecord::Base
        def self.table_name
          "oauth2_provider_#{name.split("::").last.underscore}"
        end
      end

      class << self
        # Create new instance of the klass and populate its attributes.
        def new_instance(klass, fields)
          instance = klass.new fields
        end
      end

    end
  end
end


require "rack/oauth2/models/active_record/client"
require "rack/oauth2/models/active_record/auth_request"
require "rack/oauth2/models/active_record/access_grant"
require "rack/oauth2/models/active_record/access_token"
require "rack/oauth2/models/active_record/issuer"
