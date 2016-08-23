class User < ApplicationRecord

  ### Associations ###
  has_one :business, dependent: :nullify
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_businesses, through: :bookmarks, class_name: 'Bookmark'

  ### Authentication ###

  # Token and digest creation for security.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(attribute,token)
    digest = self.send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


end
