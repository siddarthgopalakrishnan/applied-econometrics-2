keep if small == 0 & groupti == 5
encode country_name, gen(c_name)
xtset c_name year

gen hc3sq = hc3^2
reg dale comp lhexp hc3 hc3sq gini pubthe i.c_name
xtreg dale comp lhexp hc3 hc3sq gini pubthe, fe
xtreg dale comp lhexp hc3 hc3sq gini pubthe, re
xtreg dale comp lhexp hc3 hc3sq gini pubthe, fe
estimates store fixed
xtreg dale comp lhexp hc3 hc3sq gini pubthe, re
estimates store random
hausman fixed random
xtreg dale comp lhexp hc3 hc3sq gini pubthe i.year, fe
testparm i.year
xtreg dale comp lhexp hc3 hc3sq gini pubthe, re
xttest0
