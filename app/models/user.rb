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


    private
    def downcase_email
        email.downcase!
    end

    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token
    end
end