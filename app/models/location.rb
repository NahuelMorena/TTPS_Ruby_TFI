class Location < ApplicationRecord
    validates :name, presence: true
    has_many :branch_offices
    belongs_to :province

    #Class method

    #Instance method
    
    def get_branch_offices
        BranchOffice.all.select { |item| item.location = self}
    end
end
