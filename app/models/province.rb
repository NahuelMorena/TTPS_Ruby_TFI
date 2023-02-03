class Province < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :locations

    #Method class

    #Instance class

    def get_branch_offices
        self.locations.sum {|item| item.get_branch_offices.size}
    end
end
