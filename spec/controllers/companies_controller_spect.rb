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
      get 'new'
      response.should be_success
    end

    it "new success" do
      get 'new'
      expect(assigns[:company]).to be_a_new(Company)
    end
  end

  describe "POST 'create'", type: :create do
    before do
      @params = {
        :name => 'aaaaa',
        :prefecture => 1,
        :address1 => 'aaa',
        :address2 => 'aaa',
        :tel => '09012341234',
        :email => 'sample@gmail.com'
      }
    end
    
    it "create a new Company" do
      expect {post :create, {:company => @params}}.to change(Company, :count).by(1)
    end

    context 'save company' do
      it "redirect show last" do
        post :create, :company => @params
        expect(response).to be_redirect
        expect(response).to redirect_to(assigns[:company])
      end
    end
    
  end


end
