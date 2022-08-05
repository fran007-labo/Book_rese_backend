require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do 
    @user = build(:user)
  end

  describe "#index" do
    it "responds successfully returns a 200 response" do
      get api_v1_users_path
      expect(response).to be_successful
    end
  end

  describe "#create" do
    context "成功パターン" do
      it "adds a user" do
        
      end
    end
  end
end