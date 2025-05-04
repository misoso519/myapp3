require_relative "boot"

require "rails/all"
require 'dotenv/load'

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])
    config.autoload_paths += %W(#{config.root}/lib)
    config.middleware.insert_before 0, Rack::Rewrite do
      r301 %r{.*}, 'https://www.kidsteachers.net$&', if: Proc.new { |rack_env|
        rack_env['HTTP_HOST'] == 'kidsteachers.net'
      }
    end
    config.importmap.draw do
      pin "@hotwired/turbo-rails"
    end  
  end
end
