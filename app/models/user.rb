class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :potins
    belongs_to :city
    has_many :comments
    #validates :password_digest, presence: true, length: { minimum: 6 }
end
