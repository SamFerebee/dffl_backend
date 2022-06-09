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

    # def playoff_appearances_total
    #     playoff_appearances.length
    # end

    def create_new_account_season_info(name)
        if name == "sam@sam.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 10, losses: 3}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 7, losses: 6}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.season_records[2021] = {wins: 8, losses: 6}
            self.current_season_rank = 5
            self.championships.push("2018")
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2015")
            self.playoff_appearances.push("2016")
            self.playoff_appearances.push("2017")
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2019")
            self.playoff_appearances.push("2020")
            self.playoff_appearances.push("2021")
        elsif name == "cooper@cooper.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 7, losses: 6}
            self.season_records[2016] = {wins: 3, losses: 10}
            self.season_records[2017] = {wins: 8, losses: 5}
            self.season_records[2018] = {wins: 7, losses: 6}
            self.season_records[2019] = {wins: 8, losses: 5}
            self.season_records[2020] = {wins: 9, losses: 4}
            self.season_records[2021] = {wins: 8, losses: 6}
            self.current_season_rank = 4
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2017")
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2019")
            self.playoff_appearances.push("2020")
            self.playoff_appearances.push("2021")
            self.championships.push("2017")
            self.championships.push("2019")
            self.last_place_finishes.push("2016")
        elsif name == "brian@brian.com"
            self.season_records[2014] = {wins: 5, losses: 8}
            self.season_records[2015] = {wins: 7, losses: 6}
            self.season_records[2016] = {wins: 9, losses: 4}
            self.season_records[2017] = {wins: 4, losses: 9}
            self.season_records[2018] = {wins: 10, losses: 3}
            self.season_records[2019] = {wins: 6, losses: 7}
            self.season_records[2020] = {wins: 9, losses: 4}
            self.season_records[2021] = {wins: 6, losses: 8}
            self.current_season_rank = 9
            self.playoff_appearances.push("2016")
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2020")
            self.championships.push("2016")
            self.last_place_finishes.push("2017")
        elsif name == "doug@doug.com"
            self.season_records[2014] = {wins: 8, losses: 5}
            self.season_records[2015] = {wins: 2, losses: 11}
            self.season_records[2016] = {wins: 3, losses: 10}
            self.season_records[2017] = {wins: 7, losses: 6}
            self.season_records[2018] = {wins: 7, losses: 6}
            self.season_records[2019] = {wins: 3, losses: 10}
            self.season_records[2020] = {wins: 4, losses: 9}
            self.season_records[2021] = {wins: 5, losses: 9}
            self.current_season_rank = 7
            self.last_place_finishes.push("2015")
            self.last_place_finishes.push("2016")
            self.last_place_finishes.push("2019")
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2017")
            
        elsif name == "shark@shark.com"
            self.season_records[2014] = {wins: 5, losses: 8}
            self.season_records[2015] = {wins: 7, losses: 6}
            self.season_records[2016] = {wins: 5, losses: 8}
            self.season_records[2017] = {wins: 6, losses: 7}
            self.season_records[2018] = {wins: 6, losses: 7}
            self.season_records[2019] = {wins: 8, losses: 5}
            self.season_records[2020] = {wins: 4, losses: 9}
            self.season_records[2021] = {wins: 10, losses: 4}
            self.playoff_appearances.push("2015")
            self.current_season_rank = 3
            self.playoff_appearances.push("2017")
            self.playoff_appearances.push("2019")
            self.championships.push("2015")
            self.playoff_appearances.push("2021")
        elsif name == "bush@bush.com"
            self.season_records[2014] = {wins: 4, losses: 9}
            self.season_records[2015] = {wins: 7, losses: 6}
            self.season_records[2016] = {wins: 3, losses: 10}
            self.season_records[2017] = {wins: 5, losses: 8}
            self.season_records[2018] = {wins: 5, losses: 8}
            self.season_records[2019] = {wins: 5, losses: 8}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.season_records[2021] = {wins: 7, losses: 7}
            self.current_season_rank = 8
            self.playoff_appearances.push("2015")
            self.championships.push("2020")
            self.playoff_appearances.push("2020")
        elsif name == "tony@tony.com"
            self.season_records[2014] = {wins: 3, losses: 10}
            self.season_records[2015] = {wins: 4, losses: 9}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 11, losses: 2}
            self.season_records[2018] = {wins: 4, losses: 9}
            self.season_records[2019] = {wins: 4, losses: 9}
            self.season_records[2020] = {wins: 9, losses: 4}
            self.season_records[2021] = {wins: 10, losses: 4}
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2016")
            self.current_season_rank = 1
            self.championships.push("2021")
            self.playoff_appearances.push("2017")
            self.playoff_appearances.push("2020")
            self.last_place_finishes.push("2021")
        elsif name == "dorn@dorn.com"
            self.season_records[2014] = {wins: 7, losses: 6}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 7, losses: 6}
            self.season_records[2017] = {wins: 6, losses: 7}
            self.season_records[2018] = {wins: 10, losses: 3}
            self.season_records[2019] = {wins: 6, losses: 7}
            self.season_records[2020] = {wins: 8, losses: 5}
            self.season_records[2021] = {wins: 4, losses: 10}
            self.last_place_finishes.push("2015")
            self.current_season_rank = 12
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2020")
            self.playoff_appearances.push("2021")
        elsif name == "colin@colin.com"
            self.season_records[2014] = {wins: 9, losses: 4}
            self.season_records[2015] = {wins: 5, losses: 8}
            self.season_records[2016] = {wins: 10, losses: 3}
            self.season_records[2017] = {wins: 4, losses: 9}
            self.season_records[2018] = {wins: 9, losses: 4}
            self.season_records[2019] = {wins: 8, losses: 5}
            self.season_records[2020] = {wins: 4, losses: 9}
            self.season_records[2021] = {wins: 4, losses: 10}
            self.current_season_rank = 11
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2016")
            self.playoff_appearances.push("2018")
            self.playoff_appearances.push("2019")
            self.championships.push("2014")
        elsif name == "kwags@kwags.com"
            self.season_records[2014] = {wins: 10, losses: 3}
            self.season_records[2015] = {wins: 9, losses: 4}
            self.season_records[2016] = {wins: 6, losses: 7}
            self.season_records[2017] = {wins: 5, losses: 8}
            self.season_records[2018] = {wins: 7, losses: 6}
            self.season_records[2019] = {wins: 6, losses: 7}
            self.season_records[2020] = {wins: 7, losses: 6}
            self.season_records[2021] = {wins: 5, losses: 9}
            self.current_season_rank = 10
            self.playoff_appearances.push("2014")
            self.playoff_appearances.push("2015")
        elsif name == "dylan@dylan.com"
            self.season_records[2014] = {wins: 4, losses: 9}
            self.season_records[2015] = {wins: 6, losses: 7}
            self.season_records[2016] = {wins: 7, losses: 6}
            self.season_records[2017] = {wins: 6, losses: 7}
            self.season_records[2018] = {wins: 1, losses: 12}
            self.season_records[2019] = {wins: 9, losses: 4}
            self.season_records[2020] = {wins: 6, losses: 7}
            self.season_records[2021] = {wins: 8, losses: 6}
            self.current_season_rank = 6
            self.playoff_appearances.push("2016")
            self.playoff_appearances.push("2017")
            self.last_place_finishes.push("2018")
            self.playoff_appearances.push("2019")
            self.playoff_appearances.push("2021")
        elsif name == "dank@dank.com"
            self.season_records[2014] = {wins: 9, losses: 4}
            self.season_records[2015] = {wins: 8, losses: 5}
            self.season_records[2016] = {wins: 8, losses: 5}
            self.season_records[2017] = {wins: 6, losses: 7}
            self.season_records[2018] = {wins: 3, losses: 10}
            self.season_records[2019] = {wins: 8, losses: 5}
            self.season_records[2020] = {wins: 4, losses: 9}
            self.season_records[2021] = {wins: 9, losses: 5}
            self.current_season_rank = 2
            self.playoff_appearances.push("2014")
            self.last_place_finishes.push("2015")
            self.playoff_appearances.push("2016")
            self.playoff_appearances.push("2019")
            self.playoff_appearances.push("2020")
            self.playoff_appearances.push("2021")
        end

    end

    def create_new_account_member_admin_status
        memberList = ["sam@sam.com", "cooper@cooper.com", "brian@brian.com", "doug@doug.com", "shark@shark.com", "bush@bush.com", "tony@tony.com", "dorn@dorn.com", "colin@colin.com", "kwags@kwags.com", "dylan@dylan.com", "dank@dank.com"]
        if memberList.include?(self.email)
            self.member = true
        else
            self.member = false
        end

        adminList = ["sam@sam.com"]
        if adminList.include?(self.email)
            self.admin = true
        else
            self.admin = false
        end
    end

    def create_new_account_season_points
        if email == "sam@sam.com"
            self.season_points[2014] = {for: 1587.62, against: 1541.32}
            self.season_points[2015] = {for: 1863.08, against: 1623.61}
            self.season_points[2016] = {for: 1663.33, against: 1531.01}
            self.season_points[2017] = {for: 1765.65, against: 1516.79}
            self.season_points[2018] = {for: 1773.47, against: 1526.84}
            self.season_points[2019] = {for: 1740.71, against: 1661.08}
            self.season_points[2020] = {for: 1720.71, against: 1639.52}
            self.season_points[2021] = {for: 1720.61, against: 1757.49}
        elsif email == "cooper@cooper.com"
            self.season_points[2014] = {for: 1551.84, against: 1503.78}
            self.season_points[2015] = {for: 1629.72, against: 1707.38}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1683.05, against: 1476.78}
            self.season_points[2018] = {for: 1674.29, against: 1697.53}
            self.season_points[2019] = {for: 1815.61, against: 1832.82}
            self.season_points[2020] = {for: 1679.06, against: 1539.33}
            self.season_points[2021] = {for: 1754.20, against: 1665.82}
        elsif email == "brian@brian.com"
            self.season_points[2014] = {for: 1602.30, against: 1686.00}
            self.season_points[2015] = {for: 1688.36, against: 1684.65}
            self.season_points[2016] = {for: 1706.65, against: 1565.69}
            self.season_points[2017] = {for: 1434.44, against: 1555.60}
            self.season_points[2018] = {for: 1973.33, against: 1670.87}
            self.season_points[2019] = {for: 1640.29, against: 1625.77}
            self.season_points[2020] = {for: 1765.33, against: 1721.56}
            self.season_points[2021] = {for: 1755.52, against: 1781.40}
        elsif email == "doug@doug.com"
            self.season_points[2014] = {for: 1520.92, against: 1475.36}
            self.season_points[2015] = {for: 1459.05, against: 1673.13}
            self.season_points[2016] = {for: 1488.94, against: 1716.26}
            self.season_points[2017] = {for: 1491.12, against: 1557.35}
            self.season_points[2018] = {for: 1747.51, against: 1730.06}
            self.season_points[2019] = {for: 1417.61, against: 1568.34}
            self.season_points[2020] = {for: 1522.72, against: 1723.25}
            self.season_points[2021] = {for: 1653.00, against: 1724.05}
        elsif email == "shark@shark.com"
            self.season_points[2014] = {for: 1632.60, against: 1627.14}
            self.season_points[2015] = {for: 1740.28, against: 1761.59}
            self.season_points[2016] = {for: 1554.99, against: 1715.18}
            self.season_points[2017] = {for: 1573.05, against: 1530.62}
            self.season_points[2018] = {for: 1548.31, against: 1557.31}
            self.season_points[2019] = {for: 1719.96, against: 1666.25}
            self.season_points[2020] = {for: 1692.64, against: 1756.43}
            self.season_points[2021] = {for: 1785.11, against: 1710.42}
        elsif email == "bush@bush.com"
            self.season_points[2014] = {for: 1461.40, against: 1563.88}
            self.season_points[2015] = {for: 1691.00, against: 1606.24}
            self.season_points[2016] = {for: 1499.50, against: 1654.40}
            self.season_points[2017] = {for: 1509.04, against: 1647.96}
            self.season_points[2018] = {for: 1763.39, against: 1913.21}
            self.season_points[2019] = {for: 1607.32, against: 1590.42}
            self.season_points[2020] = {for: 1628.25, against: 1558.44}
            self.season_points[2021] = {for: 1752.41, against: 1737.44}
        elsif email == "tony@tony.com"
            self.season_points[2014] = {for: 1521.28, against: 1654.64}
            self.season_points[2015] = {for: 1553.78, against: 1630.58}
            self.season_points[2016] = {for: 1572.06, against: 1585.89}
            self.season_points[2017] = {for: 1641.97, against: 1289.25}
            self.season_points[2018] = {for: 1514.78, against: 1718.48}
            self.season_points[2019] = {for: 1380.88, against: 1667.51}
            self.season_points[2020] = {for: 1740.56, against: 1645.44}
            self.season_points[2021] = {for: 1980.49, against: 1863.06}
        elsif email == "dorn@dorn.com"
            self.season_points[2014] = {for: 1531.18, against: 1480.06}
            self.season_points[2015] = {for: 1628.26, against: 1518.20}
            self.season_points[2016] = {for: 1617.56, against: 1609.56}
            self.season_points[2017] = {for: 1447.13, against: 1535.32}
            self.season_points[2018] = {for: 1760.66, against: 1641.59}
            self.season_points[2019] = {for: 1490.51, against: 1531.11}
            self.season_points[2020] = {for: 1609.07, against: 1517.64}
            self.season_points[2021] = {for: 1566.62, against: 1739.62}
        elsif email == "colin@colin.com"
            self.season_points[2014] = {for: 1585.38, against: 1530.88}
            self.season_points[2015] = {for: 1468.22, against: 1627.05}
            self.season_points[2016] = {for: 1973.61, against: 1689.03}
            self.season_points[2017] = {for: 1481.58, against: 1591.55}
            self.season_points[2018] = {for: 1883.61, against: 1599.59}
            self.season_points[2019] = {for: 1527.22, against: 1500.89}
            self.season_points[2020] = {for: 1488.77, against: 1651.83}
            self.season_points[2021] = {for: 1674.59, against: 1860.89}
        elsif email == "kwags@kwags.com"
            self.season_points[2014] = {for: 1756.48, against: 1526.20}
            self.season_points[2015] = {for: 1641.82, against: 1509.01}
            self.season_points[2016] = {for: 1611.84, against: 1600.08}
            self.season_points[2017] = {for: 1417.27, against: 1546.58}
            self.season_points[2018] = {for: 1566.47, against: 1659.36}
            self.season_points[2019] = {for: 1497.08, against: 1473.92}
            self.season_points[2020] = {for: 1552.39, against: 1482.42}
            self.season_points[2021] = {for: 1577.24, against: 1684.22}
        elsif email == "dylan@dylan.com"
            self.season_points[2014] = {for: 1431.20, against: 1734.52}
            self.season_points[2015] = {for: 1572.61, against: 1615.40}
            self.season_points[2016] = {for: 1657.45, against: 1681.89}
            self.season_points[2017] = {for: 1489.06, against: 1482.22}
            self.season_points[2018] = {for: 1306.12, against: 1684.81}
            self.season_points[2019] = {for: 1790.02, against: 1545.04}
            self.season_points[2020] = {for: 1629.57, against: 1591.26}
            self.season_points[2021] = {for: 1808.95, against: 1690.46}
        elsif email == "dank@dank.com"
            self.season_points[2014] = {for: 1495.92, against: 1354.36}
            self.season_points[2015] = {for: 1621.63, against: 1600.97}
            self.season_points[2016] = {for: 1641.00, against: 1634.07}
            self.season_points[2017] = {for: 1396.63, against: 1599.97}
            self.season_points[2018] = {for: 1544.06, against: 1656.35}
            self.season_points[2019] = {for: 1640.34, against: 1605.20}
            self.season_points[2020] = {for: 1561.79, against: 1763.24}
            self.season_points[2021] = {for: 1817.67, against: 1631.54}
        end
    end

end
