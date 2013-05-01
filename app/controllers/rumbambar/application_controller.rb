module Rumbambar
  class ApplicationController < ActionController::Base
    before_filter :authenticate_rumba_user!

    def index
    end
  end
end
