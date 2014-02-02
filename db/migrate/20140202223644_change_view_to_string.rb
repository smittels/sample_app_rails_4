class ChangeViewToString < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :document_list_requests do |t|
        dir.up   { t.change :view, :string}
        dir.down { t.change :view, :integer}
      end
    end
  end
end
