class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.references :user, foreign_key: true
      t.string :ttxid
      t.integer :certificate_number
      t.string :ownership_name
      t.string :dba_name
      t.string :full_business_address
      t.string :city
      t.string :state
      t.integer :business_zip
      t.date :dba_start_date
      t.date :dba_end_date
      t.date :location_start_date
      t.date :location_end_date
      t.string :mailing_address_1
      t.string :mailing_city_state_zip_code
      t.text :location, 

      t.timestamps
    end
  end
end
