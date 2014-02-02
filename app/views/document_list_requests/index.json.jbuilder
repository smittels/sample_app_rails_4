json.array!(@document_list_requests) do |document_list_request|
  json.extract! document_list_request, :celebrityIds, :limit, :view, :orderBy, :profileId, :star0Factor, :star1Factor, :star2Factor, :star3Factor, :star4Factor, :docSentimentFactor, :celebSentimentFactor, :unblockThreshold
  json.url document_list_request_url(document_list_request, format: :json)
end