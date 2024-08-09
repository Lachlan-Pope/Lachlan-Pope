clear all 
cls

use "C:\Users\lachl\Downloads\Gravity_V202211.dta" 
 


keep if year >= 1946
keep if year < 2020 



rename iso3_o exporter
rename iso3_d importer 
gen distance = ln(distw_arithmetic)
replace distance = 0 if distance == .
gen entry_year_EXP = .
gen entry_year_IMP = .

keep if (importer == "ALB" | importer == "AND" | importer == "AUT" | importer == "BEL" | importer == "BIH" | importer == "BLR" | importer == "BGR" | importer == "BUL" | ///
    importer == "CAN" | importer == "CHE" | importer == "CRO" | importer == "CYP" | importer == "CZE" |  importer == "DDR" |importer == "DEU" | importer == "DNK" | importer == "ESP" | ///
    importer == "EST" | importer == "FIN" | importer == "FRA" | importer == "GBR" | importer == "GRC" | importer == "HRV" | importer == "HUN" | importer == "IRL" | ///
    importer == "ISL" | importer == "ITA" | importer == "KOS" | importer == "LIE" | importer == "LUX" | importer == "LVA" | importer == "LTU" | importer == "MDA" | ///
    importer == "MCO" | importer == "MKD" | importer == "MLT" | importer == "MNE" | importer == "NLD" | importer == "NOR" | importer == "POL" | importer == "PRT" | ///
    importer == "ROU" | importer == "RUS" | importer == "SMR" | importer == "SRB" | importer == "SVK" | importer == "SVN" | importer == "SWE" | importer == "TUR" | ///
    importer == "UKR" | importer == "USA" | importer == "VAT") & ///
   (exporter == "ALB" | exporter == "AND" | exporter == "AUT" | exporter == "BEL" | exporter == "BIH" | exporter == "BLR" | exporter == "BGR" | exporter == "BUL" | ///
    exporter == "CAN" | exporter == "CHE" | exporter == "CRO" | exporter == "CYP" | exporter == "CZE" | exporter == "DDR" | exporter == "DEU" | exporter == "DNK" | exporter == "ESP" | ///
    exporter == "EST" | exporter == "FIN" | exporter == "FRA" | exporter == "GBR" | exporter == "GRC" | exporter == "HRV" | exporter == "HUN" | exporter == "IRL" | ///
    exporter == "ISL" | exporter == "ITA" | exporter == "KOS" | exporter == "LIE" | exporter == "LUX" | exporter == "LVA" | exporter == "LTU" | exporter == "MDA" | ///
    exporter == "MCO" | exporter == "MKD" | exporter == "MLT" | exporter == "MNE" | exporter == "NLD" | exporter == "NOR" | exporter == "POL" | exporter == "PRT" | ///
    exporter == "ROU" | exporter == "RUS" | exporter == "SMR" | exporter == "SRB" | exporter == "SVK" | exporter == "SVN" | exporter == "SWE" | exporter == "TUR" | ///
    exporter == "UKR" | exporter == "USA" | exporter == "VAT")




replace entry_year_EXP = 2009 if exporter == "ALB"
replace entry_year_EXP = 2004 if exporter == "BUL"
replace entry_year_EXP = 1999 if exporter == "CZE"
replace entry_year_EXP = 1955 if exporter == "DEU"
replace entry_year_EXP = 1990 if exporter == "DDR"
replace entry_year_EXP = 1999 if exporter == "HUN"
replace entry_year_EXP = 1999 if exporter == "POL"
replace entry_year_EXP = 2004 if exporter == "ROU"

gen NATOENTRY_e =.
replace NATOENTRY_e =1 if year == entry_year_EXP
replace NATOENTRY_e = 0 if NATOENTRY_e ==.



replace entry_year_IMP = 2009 if importer == "ALB"
replace entry_year_IMP = 2004 if importer == "BUL"
replace entry_year_IMP = 1999 if importer == "CZE"
replace entry_year_IMP = 1999 if importer == "HUN"
replace entry_year_IMP = 1999 if importer == "POL"
replace entry_year_IMP = 2004 if importer == "ROU"
replace entry_year_IMP = 1955 if importer == "DEU"
replace entry_year_IMP = 1990 if importer == "DDR"
gen entry_year_ALLY =. 


gen NATOENTRY_i =.
replace NATOENTRY_i =1 if year == entry_year_IMP
replace NATOENTRY_i = 0 if NATOENTRY_i ==.

gen NATOENTRY = .
replace NATOENTRY =1 if (NATOENTRY_i ==1 | NATOENTRY_e ==1)

replace entry_year_ALLY = 2009 if exporter == "ALB"
replace entry_year_ALLY = 1949 if exporter == "BEL"
replace entry_year_ALLY = 2004 if exporter == "BUL"
replace entry_year_ALLY = 1949 if exporter == "CAN"
replace entry_year_ALLY = 2009 if exporter == "CRO"
replace entry_year_ALLY = 1999 if exporter == "CZE"
replace entry_year_ALLY = 1949 if exporter == "DNK"
replace entry_year_ALLY = 2004 if exporter == "EST"
replace entry_year_ALLY = 2023 if exporter == "FIN"
replace entry_year_ALLY = 1949 if exporter == "FRA"
replace entry_year_ALLY = 1955 if exporter == "DDR"
replace entry_year_ALLY = 1990 if exporter == "DEU"
replace entry_year_ALLY = 1952 if exporter == "GRC"
replace entry_year_ALLY = 1999 if exporter == "HUN"
replace entry_year_ALLY = 1949 if exporter == "ISL"
replace entry_year_ALLY = 1949 if exporter == "ITA"
replace entry_year_ALLY = 2004 if exporter == "LVA"
replace entry_year_ALLY = 2004 if exporter == "LTU"
replace entry_year_ALLY = 1949 if exporter == "LUX"
replace entry_year_ALLY = 2017 if exporter == "MNE"
replace entry_year_ALLY = 1949 if exporter == "NLD"
replace entry_year_ALLY = 2020 if exporter == "MKD"
replace entry_year_ALLY = 1949 if exporter == "NOR"
replace entry_year_ALLY = 1999 if exporter == "POL"
replace entry_year_ALLY = 1949 if exporter == "PRT"
replace entry_year_ALLY = 2004 if exporter == "ROU"
replace entry_year_ALLY = 2004 if exporter == "SVK"
replace entry_year_ALLY = 2004 if exporter == "SVN"
replace entry_year_ALLY = 1982 if exporter == "ESP"
replace entry_year_ALLY = 2024 if exporter == "SWE"
replace entry_year_ALLY = 1952 if exporter == "TUR"
replace entry_year_ALLY = 1949 if exporter == "GBR"
replace entry_year_ALLY = 1949 if exporter == "USA"

gen entry_year_ALLY_i =. 


replace entry_year_ALLY_i = 2009 if importer == "ALB"
replace entry_year_ALLY_i = 1949 if importer == "BEL"
replace entry_year_ALLY_i = 2004 if importer == "BUL"
replace entry_year_ALLY_i = 1949 if importer == "CAN"
replace entry_year_ALLY_i = 2009 if importer == "CRO"
replace entry_year_ALLY_i = 1999 if importer == "CZE"
replace entry_year_ALLY_i = 1949 if importer == "DNK"
replace entry_year_ALLY_i = 2004 if importer == "EST"
replace entry_year_ALLY_i = 2023 if importer == "FIN"
replace entry_year_ALLY_i = 1949 if importer == "FRA"
replace entry_year_ALLY_i = 1955 if importer == "DDR"
replace entry_year_ALLY_i = 1990 if importer == "DEU"
replace entry_year_ALLY_i = 1952 if importer == "GRC"
replace entry_year_ALLY_i = 1999 if importer == "HUN"
replace entry_year_ALLY_i = 1949 if importer == "ISL"
replace entry_year_ALLY_i = 1949 if importer == "ITA"
replace entry_year_ALLY_i = 2004 if importer == "LVA"
replace entry_year_ALLY_i = 2004 if importer == "LTU"
replace entry_year_ALLY_i = 1949 if importer == "LUX"
replace entry_year_ALLY_i = 2017 if importer == "MNE"
replace entry_year_ALLY_i = 1949 if importer == "NLD"
replace entry_year_ALLY_i = 2020 if importer == "MKD"
replace entry_year_ALLY_i = 1949 if importer == "NOR"
replace entry_year_ALLY_i = 1999 if importer == "POL"
replace entry_year_ALLY_i = 1949 if importer == "PRT"
replace entry_year_ALLY_i = 2004 if importer == "ROU"
replace entry_year_ALLY_i = 2004 if importer == "SVK"
replace entry_year_ALLY_i = 2004 if importer == "SVN"
replace entry_year_ALLY_i = 1982 if importer == "ESP"
replace entry_year_ALLY_i = 2024 if importer == "SWE"
replace entry_year_ALLY_i = 1952 if importer == "TUR"
replace entry_year_ALLY_i = 1949 if importer == "GBR"
replace entry_year_ALLY_i = 1949 if importer == "USA"


gen ALLY =. 
replace ALLY = 1 if year >= entry_year_ALLY & year >= entry_year_ALLY_i & entry_year_ALLY != . & entry_year_ALLY_i != . 

replace ALLY = 0 if ALLY ==. 


gen NATO_FORMERWP = .
replace NATO_FORMERWP = 1 if (year >= entry_year_EXP | year >= entry_year_IMP) & ALLY == 1
replace NATO_FORMERWP = 0 if NATO_FORMERWP == .

gen NATOFLOW = . 
replace NATOFLOW = 1 if (year >= entry_year_ALLY | year >= entry_year_ALLY_i) 
replace NATOFLOW = 0 if ALLY == 0

gen NATO = . 
replace NATO = 1 if (year >= entry_year_ALLY & year >= entry_year_ALLY_i) 
replace NATO= 0 if ALLY == 0

gen lndistance = ln(distw_harmonic) 



gen entry_year_WP = .
gen exit_year_WP = . 

replace entry_year_WP = 1955 if exporter == "ALB"
replace entry_year_WP = 1955 if exporter == "BUL"
replace entry_year_WP = 1955 if exporter == "CZE"
replace entry_year_WP = 1955 if exporter == "HUN"
replace entry_year_WP = 1955 if exporter == "POL"
replace entry_year_WP = 1955 if exporter == "ROU"
replace entry_year_WP = 1955 if exporter == "DDR" 




replace exit_year_WP = 1968 if exporter == "ALB"
replace exit_year_WP = 1990 if exporter == "DDR"
replace exit_year_WP = 1991 if exporter == "BUL"
replace exit_year_WP = 1991 if exporter == "CZE"
replace exit_year_WP = 1991 if exporter == "HUN"
replace exit_year_WP = 1991 if exporter == "POL"
replace exit_year_WP = 1991 if exporter == "ROU"

gen W_PACT_exp = .
replace W_PACT_exp = 1 if year >= entry_year_WP
replace W_PACT_exp = 0 if year >= exit_year_WP
replace W_PACT_exp  = 0 if W_PACT_exp == . 


gen entry_year_WP_I = .
replace entry_year_WP_I = 1955 if importer == "DDR" 
replace entry_year_WP_I = 1955 if importer == "ALB"
replace entry_year_WP_I = 1955 if importer == "BUL"
replace entry_year_WP_I = 1955 if importer == "CZE"
replace entry_year_WP_I = 1955 if importer == "HUN"
replace entry_year_WP_I = 1955 if importer == "POL"
replace entry_year_WP_I = 1955 if importer == "ROU"


gen exit_year_WP_I = .
replace exit_year_WP_I = 1968 if importer == "ALB"
replace exit_year_WP_I = 1990 if importer == "DDR"
replace exit_year_WP_I = 1991 if importer == "BUL"
replace exit_year_WP_I = 1991 if importer == "CZE"
replace exit_year_WP_I = 1991 if importer == "HUN"
replace exit_year_WP_I = 1991 if importer == "POL"
replace exit_year_WP_I = 1991 if importer == "ROU"

gen W_PACT_imp = .
replace W_PACT_imp = 1 if year >= entry_year_WP_I
replace W_PACT_imp = 0 if year >= exit_year_WP_I 

replace W_PACT_imp  = 0 if W_PACT_imp == . 


gen W_PACT = . 
replace W_PACT = 1 if W_PACT_exp == 1 & W_PACT_imp == 1
replace W_PACT = 0 if W_PACT ==. 


gen NATO_NOWP =. 
replace NATO_NOWP = 1 if   (exporter == "BEL" | exporter == "CAN" | exporter == "CRO" | exporter == "DNK" | exporter == "EST" | exporter == "FIN" | exporter == "FRA" | exporter == "GRC" | exporter == "ISL" | exporter == "ITA" | exporter == "LVA" | exporter == "LTU" | exporter == "LUX" | exporter == "MNE" | exporter == "NLD" | exporter == "MKD" | exporter == "NOR" | exporter == "PRT" | exporter == "SVK" | exporter == "SVN" | exporter == "ESP" | exporter == "SWE" | exporter == "TUR" | exporter == "GBR" | exporter == "USA")&(importer == "BEL" | importer == "CAN" | importer == "CRO" | importer == "DNK" | importer == "EST" | importer == "FIN" | importer == "FRA" | importer == "GRC" | importer == "ISL" | importer == "ITA" | importer == "LVA" | importer == "LTU" | importer == "LUX" | importer == "MNE" | importer == "NLD" | importer == "MKD" | importer == "NOR" | importer == "PRT" | importer == "SVK" | importer == "SVN" | importer == "ESP" | importer == "SWE" | importer == "TUR" | importer == "GBR" | importer == "USA") & ALLY == 1
replace NATO_NOWP = 0 if NATO_NOWP == . 




sort importer exporter year 

gen lead_entryNATO =. 
by importer exporter: replace lead_entryNATO = NATOENTRY[_n+1] if _n > 1
replace lead_entryNATO = 0 if lead_entryNATO ==. 


gen lead_entryNATO2 =. 
by importer exporter: replace lead_entryNATO2 =NATOENTRY[_n+2] if _n > 1
replace lead_entryNATO2 = 0 if lead_entryNATO2 ==. 

gen trade = tradeflow_comtrade_o
bysort exporter year:  egen tottrade = total(trade) if exporter!=importer 
gen gdpexp = gdp_o
gen gdpimp = gdp_d
gen intratrade = gdpexp - tottrade 
bysort exporter year: egen intratrademax = max(intratrade)   
replace trade = intratrademax if exporter==importer 



gen lntrade = ln(trade)

gen scaletrade = trade/10


gen gdpexpPERCAP = gdpcap_o
gen gdpimpPERCAP = gdpcap_d

gen EU = . 
replace EU =1 if eu_o ==1 & eu_d ==1 
replace EU =0 if EU ==. 


keep distance scaletrade year exporter importer trade W_PACT NATO_FORMERWP gdpexp gdpimp lead_entryNATO lead_entryNATO2 lntrade EU lntrade NATOFLOW NATO_NOWP NATO



sleep 2500
save LACHDATA, replace
clear
use LACHDATA, replace 

egen imp_time = group(importer year) 
egen pair_id = group(exporter importer)
egen exp_time = group(exporter year) 


gen lngdpexp = ln(gdpexp)
gen lngdpimp = ln(gdpimp)

gen lndistance =ln(distance)



reg lntrade lndistance NATO_FORMERWP NATO_NOWP W_PACT EU lngdpexp lngdpimp lead_entryNATO lead_entryNATO2 if exporter!=importer

estat hettest, rhs

reg lntrade lndistance NATO_NOWP NATO_FORMERWP W_PACT EU lngdpexp lngdpimp lead_entryNATO lead_entryNATO2 if exporter!=importer, cluster(pair_id)


ppmlhdfe scaletrade lndistance NATO_NOWP NATO_FORMERWP W_PACT EU if exporter!=importer, absorb(exp_time imp_time) cluster(pair_id)

ppmlhdfe scaletrade lndistance NATO_NOWP NATO_FORMERWP W_PACT lead_entryNATO EU if exporter!=importer, absorb(exp_time imp_time) cluster(pair_id)

ppmlhdfe scaletrade lndistance NATO_NOWP NATO_FORMERWP W_PACT lead_entryNATO EU lead_entryNATO2 if exporter!=importer, absorb(exp_time imp_time) cluster(pair_id)

ppmlhdfe scaletrade lndistance NATO_NOWP NATO_FORMERWP W_PACT EU lngdpexp lngdpimp lead_entryNATO lead_entryNATO2 if exporter!=importer, absorb(year) cluster(pair_id)

ppmlhdfe scaletrade lndistance NATO_NOWP NATO_FORMERWP W_PACT EU lngdpexp lngdpimp lead_entryNATO lead_entryNATO2 if exporter!=importer, absorb(importer exporter) cluster(pair_id)

ppmlhdfe scaletrade NATO_NOWP NATO_FORMERWP W_PACT lead_entryNATO EU lead_entryNATO2 if exporter!=importer, absorb(pair_id exp_time imp_time) cluster(pair_id)

*NOW, ALTERNATIVE ANALYSIS

clear all

use "C:\Users\lachl\Downloads\Gravity_V202211.dta" 
 


keep if year >= 1946
keep if year < 2020 



rename iso3_o exporter
rename iso3_d importer 
gen distance = ln(distw_arithmetic)
replace distance = 0 if distance == .
gen entry_year_EXP = .
gen entry_year_IMP = .


replace entry_year_EXP = 2009 if exporter == "ALB"
replace entry_year_EXP = 2004 if exporter == "BUL"
replace entry_year_EXP = 1999 if exporter == "CZE"
replace entry_year_EXP = 1955 if exporter == "DEU"
replace entry_year_EXP = 1990 if exporter == "DDR"
replace entry_year_EXP = 1999 if exporter == "HUN"
replace entry_year_EXP = 1999 if exporter == "POL"
replace entry_year_EXP = 2004 if exporter == "ROU"

gen NATOENTRY_e =.
replace NATOENTRY_e =1 if year == entry_year_EXP
replace NATOENTRY_e = 0 if NATOENTRY_e ==.



replace entry_year_IMP = 2009 if importer == "ALB"
replace entry_year_IMP = 2004 if importer == "BUL"
replace entry_year_IMP = 1999 if importer == "CZE"
replace entry_year_IMP = 1999 if importer == "HUN"
replace entry_year_IMP = 1999 if importer == "POL"
replace entry_year_IMP = 2004 if importer == "ROU"
replace entry_year_IMP = 1955 if importer == "DEU"
replace entry_year_IMP = 1990 if importer == "DDR"
gen entry_year_ALLY =. 


gen NATOENTRY_i =.
replace NATOENTRY_i =1 if year == entry_year_IMP
replace NATOENTRY_i = 0 if NATOENTRY_i ==.

gen NATOENTRY = .
replace NATOENTRY =1 if (NATOENTRY_i ==1 | NATOENTRY_e ==1)

replace entry_year_ALLY = 2009 if exporter == "ALB"
replace entry_year_ALLY = 1949 if exporter == "BEL"
replace entry_year_ALLY = 2004 if exporter == "BUL"
replace entry_year_ALLY = 1949 if exporter == "CAN"
replace entry_year_ALLY = 2009 if exporter == "CRO"
replace entry_year_ALLY = 1999 if exporter == "CZE"
replace entry_year_ALLY = 1949 if exporter == "DNK"
replace entry_year_ALLY = 2004 if exporter == "EST"
replace entry_year_ALLY = 2023 if exporter == "FIN"
replace entry_year_ALLY = 1949 if exporter == "FRA"
replace entry_year_ALLY = 1955 if exporter == "DDR"
replace entry_year_ALLY = 1990 if exporter == "DEU"
replace entry_year_ALLY = 1952 if exporter == "GRC"
replace entry_year_ALLY = 1999 if exporter == "HUN"
replace entry_year_ALLY = 1949 if exporter == "ISL"
replace entry_year_ALLY = 1949 if exporter == "ITA"
replace entry_year_ALLY = 2004 if exporter == "LVA"
replace entry_year_ALLY = 2004 if exporter == "LTU"
replace entry_year_ALLY = 1949 if exporter == "LUX"
replace entry_year_ALLY = 2017 if exporter == "MNE"
replace entry_year_ALLY = 1949 if exporter == "NLD"
replace entry_year_ALLY = 2020 if exporter == "MKD"
replace entry_year_ALLY = 1949 if exporter == "NOR"
replace entry_year_ALLY = 1999 if exporter == "POL"
replace entry_year_ALLY = 1949 if exporter == "PRT"
replace entry_year_ALLY = 2004 if exporter == "ROU"
replace entry_year_ALLY = 2004 if exporter == "SVK"
replace entry_year_ALLY = 2004 if exporter == "SVN"
replace entry_year_ALLY = 1982 if exporter == "ESP"
replace entry_year_ALLY = 2024 if exporter == "SWE"
replace entry_year_ALLY = 1952 if exporter == "TUR"
replace entry_year_ALLY = 1949 if exporter == "GBR"
replace entry_year_ALLY = 1949 if exporter == "USA"

gen entry_year_ALLY_i =. 


replace entry_year_ALLY_i = 2009 if importer == "ALB"
replace entry_year_ALLY_i = 1949 if importer == "BEL"
replace entry_year_ALLY_i = 2004 if importer == "BUL"
replace entry_year_ALLY_i = 1949 if importer == "CAN"
replace entry_year_ALLY_i = 2009 if importer == "CRO"
replace entry_year_ALLY_i = 1999 if importer == "CZE"
replace entry_year_ALLY_i = 1949 if importer == "DNK"
replace entry_year_ALLY_i = 2004 if importer == "EST"
replace entry_year_ALLY_i = 2023 if importer == "FIN"
replace entry_year_ALLY_i = 1949 if importer == "FRA"
replace entry_year_ALLY_i = 1955 if importer == "DDR"
replace entry_year_ALLY_i = 1990 if importer == "DEU"
replace entry_year_ALLY_i = 1952 if importer == "GRC"
replace entry_year_ALLY_i = 1999 if importer == "HUN"
replace entry_year_ALLY_i = 1949 if importer == "ISL"
replace entry_year_ALLY_i = 1949 if importer == "ITA"
replace entry_year_ALLY_i = 2004 if importer == "LVA"
replace entry_year_ALLY_i = 2004 if importer == "LTU"
replace entry_year_ALLY_i = 1949 if importer == "LUX"
replace entry_year_ALLY_i = 2017 if importer == "MNE"
replace entry_year_ALLY_i = 1949 if importer == "NLD"
replace entry_year_ALLY_i = 2020 if importer == "MKD"
replace entry_year_ALLY_i = 1949 if importer == "NOR"
replace entry_year_ALLY_i = 1999 if importer == "POL"
replace entry_year_ALLY_i = 1949 if importer == "PRT"
replace entry_year_ALLY_i = 2004 if importer == "ROU"
replace entry_year_ALLY_i = 2004 if importer == "SVK"
replace entry_year_ALLY_i = 2004 if importer == "SVN"
replace entry_year_ALLY_i = 1982 if importer == "ESP"
replace entry_year_ALLY_i = 2024 if importer == "SWE"
replace entry_year_ALLY_i = 1952 if importer == "TUR"
replace entry_year_ALLY_i = 1949 if importer == "GBR"
replace entry_year_ALLY_i = 1949 if importer == "USA"


gen ALLY =. 
replace ALLY = 1 if year >= entry_year_ALLY & year >= entry_year_ALLY_i & entry_year_ALLY != . & entry_year_ALLY_i != . 

replace ALLY = 0 if ALLY ==. 


gen NATO_FORMERWP = .
replace NATO_FORMERWP = 1 if (year >= entry_year_EXP | year >= entry_year_IMP) & ALLY == 1
replace NATO_FORMERWP = 0 if NATO_FORMERWP == .

gen NATOFLOW = . 
replace NATOFLOW = 1 if (year >= entry_year_ALLY | year >= entry_year_ALLY_i) 
replace NATOFLOW = 0 if ALLY == 0

gen NATO = . 
replace NATO = 1 if (year >= entry_year_ALLY & year >= entry_year_ALLY_i) 
replace NATO= 0 if ALLY == 0

gen lndistance = ln(distw_harmonic) 



gen entry_year_WP = .
gen exit_year_WP = . 

replace entry_year_WP = 1955 if exporter == "ALB"
replace entry_year_WP = 1955 if exporter == "BUL"
replace entry_year_WP = 1955 if exporter == "CZE"
replace entry_year_WP = 1955 if exporter == "HUN"
replace entry_year_WP = 1955 if exporter == "POL"
replace entry_year_WP = 1955 if exporter == "ROU"
replace entry_year_WP = 1955 if exporter == "DDR" 




replace exit_year_WP = 1968 if exporter == "ALB"
replace exit_year_WP = 1990 if exporter == "DDR"
replace exit_year_WP = 1991 if exporter == "BUL"
replace exit_year_WP = 1991 if exporter == "CZE"
replace exit_year_WP = 1991 if exporter == "HUN"
replace exit_year_WP = 1991 if exporter == "POL"
replace exit_year_WP = 1991 if exporter == "ROU"

gen W_PACT_exp = .
replace W_PACT_exp = 1 if year >= entry_year_WP
replace W_PACT_exp = 0 if year >= exit_year_WP
replace W_PACT_exp  = 0 if W_PACT_exp == . 


gen entry_year_WP_I = .
replace entry_year_WP_I = 1955 if importer == "DDR" 
replace entry_year_WP_I = 1955 if importer == "ALB"
replace entry_year_WP_I = 1955 if importer == "BUL"
replace entry_year_WP_I = 1955 if importer == "CZE"
replace entry_year_WP_I = 1955 if importer == "HUN"
replace entry_year_WP_I = 1955 if importer == "POL"
replace entry_year_WP_I = 1955 if importer == "ROU"


gen exit_year_WP_I = .
replace exit_year_WP_I = 1968 if importer == "ALB"
replace exit_year_WP_I = 1990 if importer == "DDR"
replace exit_year_WP_I = 1991 if importer == "BUL"
replace exit_year_WP_I = 1991 if importer == "CZE"
replace exit_year_WP_I = 1991 if importer == "HUN"
replace exit_year_WP_I = 1991 if importer == "POL"
replace exit_year_WP_I = 1991 if importer == "ROU"

gen W_PACT_imp = .
replace W_PACT_imp = 1 if year >= entry_year_WP_I
replace W_PACT_imp = 0 if year >= exit_year_WP_I 

replace W_PACT_imp  = 0 if W_PACT_imp == . 


gen W_PACT = . 
replace W_PACT = 1 if W_PACT_exp == 1 & W_PACT_imp == 1
replace W_PACT = 0 if W_PACT ==. 


gen NATO_NOWP =. 
replace NATO_NOWP = 1 if   (exporter == "BEL" | exporter == "CAN" | exporter == "CRO" | exporter == "DNK" | exporter == "EST" | exporter == "FIN" | exporter == "FRA" | exporter == "GRC" | exporter == "ISL" | exporter == "ITA" | exporter == "LVA" | exporter == "LTU" | exporter == "LUX" | exporter == "MNE" | exporter == "NLD" | exporter == "MKD" | exporter == "NOR" | exporter == "PRT" | exporter == "SVK" | exporter == "SVN" | exporter == "ESP" | exporter == "SWE" | exporter == "TUR" | exporter == "GBR" | exporter == "USA")&(importer == "BEL" | importer == "CAN" | importer == "CRO" | importer == "DNK" | importer == "EST" | importer == "FIN" | importer == "FRA" | importer == "GRC" | importer == "ISL" | importer == "ITA" | importer == "LVA" | importer == "LTU" | importer == "LUX" | importer == "MNE" | importer == "NLD" | importer == "MKD" | importer == "NOR" | importer == "PRT" | importer == "SVK" | importer == "SVN" | importer == "ESP" | importer == "SWE" | importer == "TUR" | importer == "GBR" | importer == "USA") & ALLY == 1
replace NATO_NOWP = 0 if NATO_NOWP == . 




sort importer exporter year 

gen lead_entryNATO =. 
by importer exporter: replace lead_entryNATO = NATOENTRY[_n+1] if _n > 1
replace lead_entryNATO = 0 if lead_entryNATO ==. 


gen lead_entryNATO2 =. 
by importer exporter: replace lead_entryNATO2 =NATOENTRY[_n+2] if _n > 1
replace lead_entryNATO2 = 0 if lead_entryNATO2 ==. 

gen trade = tradeflow_comtrade_o
bysort exporter year:  egen tottrade = total(trade) if exporter!=importer 
gen gdpexp = gdp_o
gen gdpimp = gdp_d
gen intratrade = gdpexp - tottrade 
bysort exporter year: egen intratrademax = max(intratrade)   
replace trade = intratrademax if exporter==importer 



gen lntrade = ln(trade)

gen scaletrade = trade/10


gen gdpexpPERCAP = gdpcap_o
gen gdpimpPERCAP = gdpcap_d

gen EU = . 
replace EU =1 if eu_o ==1 & eu_d ==1 
replace EU =0 if EU ==. 


keep distance scaletrade year exporter importer trade W_PACT NATO_FORMERWP gdpexp gdpimp lead_entryNATO lead_entryNATO2 lntrade EU lntrade NATOFLOW NATO_NOWP NATO



sleep 2500
save LACHDATA, replace
clear
use LACHDATA, replace 

egen imp_time = group(importer year) 
egen pair_id = group(exporter importer)
egen exp_time = group(exporter year) 


gen lngdpexp = ln(gdpexp)
gen lngdpimp = ln(gdpimp)

gen lndistance =ln(distance)




ppmlhdfe scaletrade W_PACT NATOFLOW EU if exporter!=importer, absorb(exporter importer pair_id) cluster(pair_id)


ppmlhdfe scaletrade W_PACT NATO EU if exporter!=importer, absorb(exp_time imp_time) cluster(pair_id)

