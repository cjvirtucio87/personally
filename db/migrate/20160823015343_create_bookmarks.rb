class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.integer :business, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
