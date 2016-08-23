class User < ApplicationRecord
  has_one :business
  has_many :bookmarks
  has_many :bookmarked_businesses, through: :bookmarks, class_name: 'Bookmark'
end
