require 'spec_helper'

describe CompaniesController do


  describe "GET 'index'", type: :destructive do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "all success" do
      get 'index'
      assigns[:companies]
    end
  end

  describe "GET 'new'", type: :new do
  	it "returns http success" do
  	  get 'index'
  	  response.should be_success
  	end

    it "new success" do
      get :new, {}, valid_session
      assigns[:company].should be_a_new(Company)
    end

  end



end