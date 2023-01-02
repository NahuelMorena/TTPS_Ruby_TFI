class WorkingDay < ApplicationRecord
    belongs_to :branch_office
    belongs_to :attention_time
end
