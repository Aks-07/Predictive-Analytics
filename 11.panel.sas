

libname panel 'C:\Users\asv161030\Desktop'; run;




proc panel data= panel.paneldata2 outest = panelest;
	id STORE QRTR;
    model REVENUE = __DM __EM __SMS /fixtwo printfixed; 
    output out = panelout2 p = pred r = residual;
run;


* if F Test for No Fixed Effects < 0.05 then no fixed effects ;


proc panel data= panel.paneldata2 outest = panelest;
	id STORE QRTR;
    model REVENUE = __DM __EM __SMS /rantwo ; 
    output out = panelout2 p = pred r = residual;
run;


* if Hausman Test for Random Effects < 0.05 then no fixed effect ;
