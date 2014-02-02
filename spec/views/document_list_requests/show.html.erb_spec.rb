require 'spec_helper'

describe "document_list_requests/show" do
  before(:each) do
    @document_list_request = assign(:document_list_request, stub_model(DocumentListRequest,
      :celebrityIds => "Celebrity Ids",
      :limit => 1,
      :view => 2,
      :orderBy => "Order By",
      :profileId => "Profile",
      :star0Factor => "Star0 Factor",
      :star1Factor => "Star1 Factor",
      :star2Factor => "Star2 Factor",
      :star3Factor => "Star3 Factor",
      :star4Factor => "Star4 Factor",
      :docSentimentFactor => "Doc Sentiment Factor",
      :celebSentimentFactor => "Celeb Sentiment Factor",
      :unblockThreshold => "Unblock Threshold"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Celebrity Ids/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Order By/)
    rendered.should match(/Profile/)
    rendered.should match(/Star0 Factor/)
    rendered.should match(/Star1 Factor/)
    rendered.should match(/Star2 Factor/)
    rendered.should match(/Star3 Factor/)
    rendered.should match(/Star4 Factor/)
    rendered.should match(/Doc Sentiment Factor/)
    rendered.should match(/Celeb Sentiment Factor/)
    rendered.should match(/Unblock Threshold/)
  end
end
