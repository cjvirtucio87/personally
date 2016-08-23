FactoryGirl.define do
  factory :business do
    user nil
    ttxid "1041836-10-151"
    certificate_number 1019554
    ownership_name "EASTMAN KELLY"
    dba_name "STICKBOOK STUDIOS"
    full_business_address "821 LEAVENWORTH ST 34"
    city "SAN FRANCISCO"
    state "CA"
    business_zip 94109
    dba_start_date "2009-08-14"
    dba_end_date "2016-08-22"
    location_start_date "2016-08-22"
    location_end_date "2016-08-22"
    mailing_address_1 "821 LEAVENWORTH ST 34"
    mailing_city_state_zip_code "SAN FRANCISCO CA 94109-"
    # location {"latitude"=>"43.161276", 
    #           "human_address"=>"{\"address\":\"343 STATE ST\",\"city\":\"ROCHESTER\",\"state\":\"NY\",\"zip\":\"14650\"}", 
    #           "needs_recoding"=>false, 
    #           "longitude"=>"-77.619386"}

    trait :changed_attrs do
        dba_name "DANEBOOK STUDIOS"
    end
  end
end
