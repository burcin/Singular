LIB "tst.lib"; tst_init();
LIB "linalg.lib";
ring R=0,x,dp;
matrix M[3][3]=3,2,1,0,2,1,0,0,3;
print(M);
list l=jordanbasis(M);
print(l[1]);
print(l[2]);
print(inverse(l[1])*M*l[1]);
tst_status(1);$
