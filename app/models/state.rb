class State < ApplicationRecord
    has_many :appointments
    validates :name, uniqueness: true
    validates :name, presence: true
end