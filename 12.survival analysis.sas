

libname sa 'C:\Users\asv161030\Desktop'; run;

libname fall 'C:\Users\asv161030\Desktop'; run;


data fall.sa;
set sa.sa;
run;


data sa_data;
set sa.sa;
censored = 0;
if tt1st_purch > 0 then censored = 1;
run;



proc lifereg data = sa_data;
model tt1st_purch*censored(0) =
discount dir_mail email1 hh_size hh_income
 
/dist = exponential;
output out = output p=median std = s; 
*where seg = 2;
run;


* distribution choices;
* gamma llogistic lnormal weibull exponential ;

proc means data = output; run;

