LIB "tst.lib"; tst_init();
LIB "finitediff.lib";
list D="Uxx","Ux","Utt","Ut","U";
list P="lambda";
list V="t","x";
setinitials(V,D,P);
trapezoid(Uxx,Ux,x);
trapezoid(Ux,U,x);
tst_status(1);$
