class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true

    has_one_attached :avatar
    validates :avatar, presence: true
    has_many :memes
    has_many :comments

    def total_seasons_wins
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

    def total_seasons_losses
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

    def total_seasons_points_for
        total = 0.0;
        self.season_points.each do |season, values|
            values.each do |key, val|
                if key == "for"
                    total += val
                end
            end
        end
        total
    end

    def total_seasons_points_against
        total = 0.0;
        self.season_points.each do |season, values|
            values.each do |key, val|
                if key == "against"
                    total += val
                end
            end
        end
        total
    end

    def total_seasons_winning_percentage
        total_seasons_wins.to_f / total_seasons_losses
    end

    def create_new_account_season_info(name)
        if name == "sam.ferebee@gmail.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
            self.championships.push("2018")
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2015")
            self.playoff_appearances.push("2016")
            self.playoff_appearances.push("2017")
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2019")
            self.playoff_appearances.push("2020")
            self.chat_username = "sam"
            self.chat_secret = "sam"
        elsif name == "cooper@cooper.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 7, losses: 6}
            self.season_records[2016] = {wins: 3, losses: 10}
            self.season_records[2017] = {wins: 8, losses: 5}
            self.season_records[2018] = {wins: 7, losses: 6}
            self.season_records[2019] = {wins: 8, losses: 5}
            self.season_records[2020] = {wins: 9, losses: 4}
            self.current_season_rank = 2
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2017")
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2019")
            self.playoff_appearances.push("2020")
            self.championships.push("2017")
            self.championships.push("2019")
            self.last_place_finishes.push("2016")
            self.chat_username = "coop"
            self.chat_secret = "coop"
        elsif name == "brian@brian.com"
            self.season_records[2014] = {wins: 5, losses: 8}
            self.season_records[2015] = {wins: 7, losses: 6}
            self.season_records[2016] = {wins: 9, losses: 4}
            self.season_records[2017] = {wins: 4, losses: 9}
            self.season_records[2018] = {wins: 10, losses: 3}
            self.season_records[2019] = {wins: 6, losses: 7}
            self.season_records[2020] = {wins: 9, losses: 4}
            self.current_season_rank = 3
            self.playoff_appearances.push("2016")
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2020")
            self.championships.push("2016")
            self.last_place_finishes.push("2017")
        elsif name == "doug@doug.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "shark@shark.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "bush@bush.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "tony@tony.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "dorn@dorn.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "colin@colin.com"
            self.season_records[2014] = {wins: 9, losses: 4}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "kwags@kwags.com"
            self.season_records[2014] = {wins: 10, losses: 3}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "dylan@dylan.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        elsif name == "dank@dank.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.current_season_rank = 1
        end

    end

    def create_new_account_member_admin_status
        memberList = ["sam.ferebee@gmail.com", "cooper@cooper.com", "brian@brian.com", "doug@doug.com", "shark@shark.com", "bush@bush.com", "tony@tony.com", "dorn@dorn.com", "colin@colin.com", "kwags@kwags.com", "dylan@dylan.com", "dank@dank.com"]
        if memberList.include?(self.email)
            self.member = true
        else
            self.member = false
        end

        adminList = ["sam.ferebee@gmail.com"]
        if adminList.include?(self.email)
            self.admin = true
        else
            self.admin = false
        end
    end

    def create_new_account_season_points
        if email == "sam.ferebee@gmail.com"
            self.season_points[2014] = {for: 1587.62, against: 1541.32}
            self.season_points[2015] = {for: 1863.08, against: 1623.61}
            self.season_points[2016] = {for: 1663.33, against: 1531.01}
            self.season_points[2017] = {for: 1765.65, against: 1516.79}
            self.season_points[2018] = {for: 1773.47, against: 1526.84}
            self.season_points[2019] = {for: 1740.71, against: 1661.08}
            self.season_points[2020] = {for: 1720.71, against: 1639.52}
        elsif email == "cooper@cooper.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "brian@brian.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1688.36, against: 1684.65}
            self.season_points[2016] = {for: 1706.65, against: 1565.69}
            self.season_points[2017] = {for: 1434.44, against: 1555.60}
            self.season_points[2018] = {for: 1973.33, against: 1670.87}
            self.season_points[2019] = {for: 1640.29, against: 1625.77}
            self.season_points[2020] = {for: 1765.33, against: 1721.56}
        elsif email == "doug@doug.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "shark@shark.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "bush@bush.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "tony@tony.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "dorn@dorn.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "colin@colin.com"
            self.season_points[2014] = {for: 1585.38, against: 1530.88}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "kwags@kwags.com"
            self.season_points[2014] = {for: 1756.48, against: 1526.20}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "dylan@dylan.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        elsif email == "dank@dank.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
        end
    end

end
