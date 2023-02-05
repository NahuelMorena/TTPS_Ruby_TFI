class State < ApplicationRecord
    validates :name, presence: true, uniqueness: true  
    has_many :appointments
end