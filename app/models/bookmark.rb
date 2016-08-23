class Bookmark < ApplicationRecord
  belongs_to :business
  belongs_to :user

  ### Validations ###
  validates_presence_of :user_id
  validates_presence_of :business_id
  
end
