require 'spec_helper'

describe "document_list_requests/index" do
  before(:each) do
    assign(:document_list_requests, [
      stub_model(DocumentListRequest,
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
      ),
      stub_model(DocumentListRequest,
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
      )
    ])
  end

  it "renders a list of document_list_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Celebrity Ids".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Order By".to_s, :count => 2
    assert_select "tr>td", :text => "Profile".to_s, :count => 2
    assert_select "tr>td", :text => "Star0 Factor".to_s, :count => 2
    assert_select "tr>td", :text => "Star1 Factor".to_s, :count => 2
    assert_select "tr>td", :text => "Star2 Factor".to_s, :count => 2
    assert_select "tr>td", :text => "Star3 Factor".to_s, :count => 2
    assert_select "tr>td", :text => "Star4 Factor".to_s, :count => 2
    assert_select "tr>td", :text => "Doc Sentiment Factor".to_s, :count => 2
    assert_select "tr>td", :text => "Celeb Sentiment Factor".to_s, :count => 2
    assert_select "tr>td", :text => "Unblock Threshold".to_s, :count => 2
  end
end
