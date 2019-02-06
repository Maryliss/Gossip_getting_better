class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :potins
    belongs_to :city
    has_many :comments
end
