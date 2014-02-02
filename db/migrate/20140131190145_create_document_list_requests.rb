class CreateDocumentListRequests < ActiveRecord::Migration
  def change
    create_table :document_list_requests do |t|
      t.string :celebrityIds
      t.integer :limit
      t.integer :view
      t.string :orderBy
      t.string :profileId
      t.string :star0Factor
      t.string :star1Factor
      t.string :star2Factor
      t.string :star3Factor
      t.string :star4Factor
      t.string :docSentimentFactor
      t.string :celebSentimentFactor
      t.string :unblockThreshold

      t.timestamps
    end
  end
end
