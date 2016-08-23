class Business < ApplicationRecord
  store_accessor :location

  ### Associations [-assoc]###
  belongs_to :user
  has_many :bookmarks
  has_many :watchers, through: :bookmarks, class_name: 'User'


  EXCEPTED_ATTRS = [
    'id',
    'user_id',
    'created_at',
    'updated_at'
  ]

  def compare(data)
    attributes.each do |k,v|
      unless EXCEPTED_ATTRS.include?(k)
        business_attrib = attributes[k]
        data_attrib = data[k]
        
        # type coercion for comparison
        case attributes[k]
        when Integer
          data_attrib = data_attrib.to_i
        when Date
          data_attrib = data_attrib.to_date
        when Hash
          if business_attrib['needs_recoding'] == "false"
            business_attrib['needs_recoding'] = false
          else
            business_attrib['needs_recoding'] = true
          end
        end

        if business_attrib != data_attrib
          binding.pry
          return false
        end
      end
    end
    true
  end

end
