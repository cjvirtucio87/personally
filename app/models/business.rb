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
        return false if attributes[k] != data[k]
      end
    end
    true
  end

end
