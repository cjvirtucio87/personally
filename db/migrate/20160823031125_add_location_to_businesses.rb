class AddLocationToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :location, :hstore
  end
end
