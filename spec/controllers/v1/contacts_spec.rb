require 'rails_helper'

describe Api::V1::ContactsController, type: :controller do
  context "when request index, return" do
    it "200 with accept header" do
      request.accept = 'application/json'
      get :index
      expect(response).to have_http_status(200)
    end
  
    it "406 without accept header" do
      get :index
      expect(response).to have_http_status(406)
    end
  end
end
