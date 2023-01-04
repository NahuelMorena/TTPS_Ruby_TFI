class Location < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true
    has_many :branch_offices
    belongs_to :province
end
