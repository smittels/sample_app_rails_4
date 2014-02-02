require 'spec_helper'

describe "document_list_requests/new" do
  before(:each) do
    assign(:document_list_request, stub_model(DocumentListRequest,
      :celebrityIds => "MyString",
      :limit => 1,
      :view => 1,
      :orderBy => "MyString",
      :profileId => "MyString",
      :star0Factor => "MyString",
      :star1Factor => "MyString",
      :star2Factor => "MyString",
      :star3Factor => "MyString",
      :star4Factor => "MyString",
      :docSentimentFactor => "MyString",
      :celebSentimentFactor => "MyString",
      :unblockThreshold => "MyString"
    ).as_new_record)
  end

  it "renders new document_list_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_list_requests_path, "post" do
      assert_select "input#document_list_request_celebrityIds[name=?]", "document_list_request[celebrityIds]"
      assert_select "input#document_list_request_limit[name=?]", "document_list_request[limit]"
      assert_select "input#document_list_request_view[name=?]", "document_list_request[view]"
      assert_select "input#document_list_request_orderBy[name=?]", "document_list_request[orderBy]"
      assert_select "input#document_list_request_profileId[name=?]", "document_list_request[profileId]"
      assert_select "input#document_list_request_star0Factor[name=?]", "document_list_request[star0Factor]"
      assert_select "input#document_list_request_star1Factor[name=?]", "document_list_request[star1Factor]"
      assert_select "input#document_list_request_star2Factor[name=?]", "document_list_request[star2Factor]"
      assert_select "input#document_list_request_star3Factor[name=?]", "document_list_request[star3Factor]"
      assert_select "input#document_list_request_star4Factor[name=?]", "document_list_request[star4Factor]"
      assert_select "input#document_list_request_docSentimentFactor[name=?]", "document_list_request[docSentimentFactor]"
      assert_select "input#document_list_request_celebSentimentFactor[name=?]", "document_list_request[celebSentimentFactor]"
      assert_select "input#document_list_request_unblockThreshold[name=?]", "document_list_request[unblockThreshold]"
    end
  end
end
