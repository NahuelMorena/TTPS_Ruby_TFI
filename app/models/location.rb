class Location < ApplicationRecord
    has_many :branch_offices
    belongs_to :province
end
