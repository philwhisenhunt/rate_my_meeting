class User < ApplicationRecord
    has_many :ratings, dependent:
    before_save { self.email = email.downcase }
    validates :name, prescence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+/.]a-z]+\z/i
    validates :email, prescence: true, length: { maximum: 255 },
                                        format: { with: VALID_EMAIL_REGEX },
                                        uniqueness: {case_sensitive: false }
    has_secure_password
    validates :password, prescence: true, length { minimum: 6}
end