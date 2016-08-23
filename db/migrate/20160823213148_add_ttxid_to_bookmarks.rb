class AddTtxidToBookmarks < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookmarks, :business
    add_column :bookmarks, :ttxid, :string
  end
end
