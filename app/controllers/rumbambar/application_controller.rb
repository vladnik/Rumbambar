module Rumbambar
  class ApplicationController < ActionController::Base
    before_filter :authenticate_rumba_user!

    def index
      @init_data = {
        asset_path: view_context.asset_path(nil),
        namespace: '/rumba/',
        models: [
          {
            name: "Model",
            attrs: ["id", "name"]
          }
        ]
      }
    end
  end
end
