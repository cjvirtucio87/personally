class Business < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :watchers, through: :bookmarks, class_name: 'User'
end
