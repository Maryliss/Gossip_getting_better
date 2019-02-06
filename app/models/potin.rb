class Potin < ApplicationRecord
    validates :title, presence: true, length: { in: 3..14 }
    validates :content, presence: true
    belongs_to :user
    has_many :comments
end
