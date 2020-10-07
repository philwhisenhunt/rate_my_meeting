class User < ApplicationRecord
    has_many :ratings, dependent: :destroy
    before_save :downcase_email
    before_create :create_activation_digest
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                                        format: { with: VALID_EMAIL_REGEX },
                                        uniqueness: {case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6}, allow_nil: false

    # Create a hash digest of the string 
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
        remember_digest
    end

    def session_token
        remember_digest || remember
    end

    private
    def downcase_email
        email.downcase!
    end

    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end
end