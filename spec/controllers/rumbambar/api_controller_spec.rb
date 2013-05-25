require 'spec_helper'

module Rumbambar
  describe ApiController do
    before(:each) do
      @user = FactoryGirl.create(:rumba_user)
      sign_in @user
    end

    describe "GET 'index'" do
      it "returns http success" do
        get :index, use_route: :rumbambar
        response.should be_success
      end
    end
  
    describe "GET 'show'" do
      it "returns http success" do
        get :show, use_route: :rumbambar
        response.should be_success
      end
    end

    describe "POST 'create'" do
      it "returns http success" do
        post :create, use_route: :rumbambar
        response.should be_success
      end
    end

    describe "POST 'update'" do
      it "returns http success" do
        post :update, use_route: :rumbambar
        response.should be_success
      end
    end

    describe "DELETE 'delete'" do
      it "returns http success" do
        delete :delete, use_route: :rumbambar
        response.should be_success
      end
    end
  
  end
end
