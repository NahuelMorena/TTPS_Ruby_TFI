class Location < ApplicationRecord
    validates :name, presence: true
    has_many :branch_offices
    belongs_to :province
end
