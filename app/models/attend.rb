class Attend < ApplicationRecord
    belongs_to :user

    # scope :self.that_day?, -> (date) { where("date LIKE ?", "%#{date}%").nil? }

    def self.that_day?(date)
        !where("date LIKE ?", "%#{date}%").empty?
    end
end
