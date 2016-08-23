class User < ApplicationRecord
  has_one :business, dependent: :nullify
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_businesses, through: :bookmarks, class_name: 'Bookmark'
end
