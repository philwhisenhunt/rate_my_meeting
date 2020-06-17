class User < ApplicationRecord
    validates :name, prescence: true, length: { maximum: 50 }
    validates :email, prescence: true, length: { maximum: 255 }
end
