class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  embeds_many :vocabs, class_name: "Vocab"
  
  before_validation { self.username = username.downcase }
  before_validation { self.email = email.downcase }
  

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :password, length: { minimum: 8, maximum: 50 }
  
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  index({ email: 1 })
end
