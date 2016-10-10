

*-------------------------------------------------------------------------------
* My Project
* samplefile.do
* 10/9/2016, version 1
* A. Balietti, HKS, EPoD
*-------------------------------------------------------------------------------


*-------------------------------------------------------------------------------
* Program Setup
*-------------------------------------------------------------------------------
version 14						// Set version number for backward compatibility		
set more off					// Disable partitioned output
clear all						// Start with a clean slate	
set linesize 80					// Line size limit to make output more readable
macro drop _all					// Clear all macros
capture log close				// Close existing log files
log using internaltraining.txt, txt replace			// Open log file
*-------------------------------------------------------------------------------


// Open data file created by createmydata.do
use analysis\mydata/dta, clear

// Summarize data
summarize


rename k12_unique_id sid
rename class_unique_id class_id
rename teacher_name teacher
rename semester_1_grade grade1
rename semester_2_grade grade2
rename final_course_grade grade3
rename pass_nopass pass



rename k12_unique_id         sid
rename class_unique_id       class_id
rename teacher_name          teacher
rename semester_1_grade      grade1
rename semester_2_grade      grade2
rename final_course_grade    grade3
rename pass_nopass           pass



keep sid class_id teacher grade1 ///
grade2 grade3 pass


keep   sid class_id teacher grade1 ///
       grade2 grade3 pass
	   
	   
foreach var of varlist * {
     sum `var'
     rename `var' data_`var'
}




rename k12_unique_id     sid
rename class_unique_id   class_id

label variable sid          "Student ID"
label variable class_id     "Course ID"


summarize grade1
sum grade1
su grade1


cd "C:/Users/Anca/My Project Folder/Datasets"
use "mydata.dta"


global data "C:/Users/echuang/My Project Folder/Datasets"
use "\${data}/data.dta"

use analysis/mydata.dta


* Test if data has 100 observations
count
assert `r(N)'==100

* Test variable percent_employed has reasonable values
assert percent_employed > 0 & percent_employed < 100


* Cutoffs
drop if var1 < 110
drop if var2 < 110
drop if var3 < 110


local cutoff = 110
drop if var1 < `cutoff'
drop if var2 < `cutoff'
drop if var3 < `cutoff'





// Close the log, end the file
log close
exit





































































