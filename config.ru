# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

if ENV["RACK_ENV"] == "production"
  require "rack/rewrite"
  use Rack::Rewrite do
    # https://github.com/jtrupiano/rack-rewrite#cname-alternative
    r301(/.*/, "https://www.yanbaru-code.com$&", if: proc {|rack_env|
      rack_env["SERVER_NAME"] == "arcane-gorge-21903.herokuapp.com"
    })
  end
end

run Rails.application
