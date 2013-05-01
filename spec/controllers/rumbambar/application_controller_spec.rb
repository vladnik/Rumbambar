require 'spec_helper'

module Rumbambar
  describe ApplicationController do

    describe 'GET #index' do
      it "redirects to login page" do
        get :index , use_route: :rumba
        expect(response.status).to eq(302)
      end
    end

  end
end
