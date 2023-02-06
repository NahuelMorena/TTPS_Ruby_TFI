class AttentionTime < ApplicationRecord
    validates :hour_start, presence: true, uniqueness: { scope: [:hour_end]}
    validates :hour_end, presence: true
    has_many :working_days

    # Class Methods

    # Instance Methods
    
    def get_by_format
        "#{self.get_hour(hour_start)} - #{self.get_hour(hour_end)}"
    end

    def valid_time?(hour)
        hour = self.get_hour(hour)
        return (self.get_hour(hour_start) <= hour) & (self.get_hour(hour_end) >= hour)
    end

    def get_working_days
      WorkingDay.get_by_attention_time(self)
    end

    private 

      def get_hour(hour)
        hour.strftime("%H:%M")
      end
end
