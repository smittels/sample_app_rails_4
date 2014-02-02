require "spec_helper"

describe DocumentListRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/document_list_requests").should route_to("document_list_requests#index")
    end

    it "routes to #new" do
      get("/document_list_requests/new").should route_to("document_list_requests#new")
    end

    it "routes to #show" do
      get("/document_list_requests/1").should route_to("document_list_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/document_list_requests/1/edit").should route_to("document_list_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/document_list_requests").should route_to("document_list_requests#create")
    end

    it "routes to #update" do
      put("/document_list_requests/1").should route_to("document_list_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/document_list_requests/1").should route_to("document_list_requests#destroy", :id => "1")
    end

  end
end
