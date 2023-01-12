class Province < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true
    has_many :locations
end
