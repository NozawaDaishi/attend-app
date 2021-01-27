class Attend < ApplicationRecord
    belongs_to :user

    def self.that_day?(from, to)
        # !where("date LIKE ?", "%#{date}%").empty?
        !where(date: from..to).empty? # から..まで
    end
end
