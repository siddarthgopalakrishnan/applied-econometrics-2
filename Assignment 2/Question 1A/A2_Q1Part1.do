log using "C:\Users\ASUS\Downloads\DC++ Downloads\A2_Q1Part1.smcl", replace

*Importing the excel sheet
import excel "E:\STUFF\3-2\ECON F342 ApEc\Assignment 2\2. G-II Panel Data\FinalBook.xlsx", sheet("Sheet1") firstrow
br

* Create 'HC3sq' variable (square of education)
gen HC3sq = HC3^2

* 'yeardummy' variable is 1 for the year 1997 and 0 for 1993
* Creating 'tropicy' variable which is the interaction term
gen tropicy = TROPICS*yeardummy

* Running regression
reg DALE COMP LHEXP HC3 HC3sq GINI yeardummy TROPICS tropicy , robust
sum DALE if TROPICS == 0 & yeardummy == 0
sum DALE if TROPICS == 1 & yeardummy == 0
sum DALE if TROPICS == 0 & yeardummy == 1
sum DALE if TROPICS == 1 & yeardummy == 1

* There could be omitted variables causing the insignificance of 'TROPICS'
* Running ovtest
ovtest
log close
