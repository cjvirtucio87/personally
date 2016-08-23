class Bookmark < ApplicationRecord 

  belongs_to :user

  ### Validations ###
  validates_presence_of :user_id
  validates_presence_of :ttxid
  
end
