class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true

    has_one_attached :avatar
    validates :avatar, presence: true

    def total_season_wins
        total = 0
        self.season_records.each do |season, values|
            values.each do |key, val|
                if key == "wins"
                    total += val
                end
            end
        end
        total
    end

    def total_season_losses
        total = 0
        self.season_records.each do |season, values|
            values.each do |key, val|
                if key == "losses"
                    total += val
                end
            end
        end
        total
    end

    def total_seasons_winning_percentage
        total_season_wins.to_f / total_season_losses
    end
end
