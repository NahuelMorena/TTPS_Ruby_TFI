class BranchOffice < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, :direction, :phone, presence: true
end
