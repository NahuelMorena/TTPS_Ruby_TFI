class WorkingDay < ApplicationRecord
    belongs_to :branch_office
    belongs_to :Attention_time
end
