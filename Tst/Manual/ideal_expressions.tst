LIB "tst.lib"; tst_init();
  ring r=0,(x,y,z),dp;
  ideal m = maxideal(1);
  m;
  poly f = x2;
  poly g = y3;
  ideal i = x*y*z , f-g, g*(x-y) + f^4 ,0, 2x-z2y;
  ideal M = i + maxideal(10);
  timer =0;
  i = M*M;
  timer;
  ncols(i);
  timer =0;
  i = M^2;
  ncols(i);
  timer;
  i[ncols(i)];
  vector v = [x,y-z,x2,y-x,x2yz2-y];
  ideal j = ideal(v);
tst_status(1);$
