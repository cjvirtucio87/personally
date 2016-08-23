class User < ApplicationRecord
  scope :watchers, -> { joins(:bookmarks).where("users.id = bookmarks.user_id") }
  
  ### Associations ###
  has_one :business, dependent: :nullify
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_businesses, through: :bookmarks, class_name: 'Bookmark'

  ### Validations ###
  # Email.
  VALID_EMAIL_REGEX = /\A[\w\d\.\_]{4,254}@\w{,6}\.\w{3}\z/

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: VALID_EMAIL_REGEX }

  # Password.
  validates :password, presence: true, length: { in: 6..40 }, on: :create
  validates :password, confirmation: true, length: { in: 6..40 }, allow_blank: true, on: :update

  ### Authentication ###
  has_secure_password
  
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
