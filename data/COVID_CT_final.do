import delimited "ct_dat_clean.csv", encoding(Big5) clear

centile dateindex, centile(5, 27.5, 50, 72.5, 95)
mkspline day5 = dateindex, cubic knots(-25, 8, 24, 38, 61)
gen ctx = 40 - ctmean



metobit ctx day51 day52 day53 day54 || personid: , cov(un) ll(0)

predict predmar, ystar(0,.) marginal
predict predtruemar , eta marginal
predict low, pr(5,.) marginal
gen predmarx = 40 - predmar
gen predtruemarx = 40 - predtruemar

scatter(predmar dateindex)