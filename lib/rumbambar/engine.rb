module Rumbambar
  class Engine < ::Rails::Engine
    isolate_namespace Rumbambar
    # Generators
    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end
end
