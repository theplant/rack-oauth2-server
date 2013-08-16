module Rack
  module OAuth2
    class Server

      module ActiveRecordExt
        def table_name
          "oauth2_provider_#{name.split("::").last.underscore}"
        end

        def self.extended(mod)
          mod.attr_protected if mod.respond_to?(:attr_protected) # protect nothing
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
