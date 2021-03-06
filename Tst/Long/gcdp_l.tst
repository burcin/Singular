// $Id$

//
// gcdp_l.tst - long tests for gcd calculations mod p.
//
// All univariate non-trivial examples come from gcdUnivP.fex
// or gcdUnivPAlpha.fex.
//
// The example in variables `a', `c', `e', ... came from `untitled2(6/p/1)'
// in stdMultivPGcd.in.
//
// To Do:
//
// o multivariate gcd calculations with parameters
//

LIB "tst.lib";
tst_init();
tst_ignore("CVS ID  : $Id$");

//
// - functions.
//

//
// simplifyGcd() - print gcd as well as normalized gcd.
//
proc simplifyGcd ( poly f, poly g )
{
  poly d=gcd( f, g );
  d;
  simplify( d, 1 );
}

//
// - ring r1=32003,x,dp.
//

tst_ignore( "ring r1=32003,x,dp;" );
ring r1=32003,x,dp;

poly f;
poly g;

f=106*x^13-583*x^12-1060*x^11+8056*x^10+1696*x^9-327*x^8+12508*x^7+8277*x^6+5609*x^5-12879*x^4+13144*x^3-2544*x^2;
g=11118*x^14-5404*x^13-908*x^12-13908*x^11+3188*x^10-8818*x^9+10439*x^8-14811*x^7+15530*x^6-4891*x^5+6322*x^4+15829*x^3-13686*x^2;

simplifyGcd(f, g);

f=-14613*x^17+2235*x^16-298*x^15+4540*x^14+7214*x^13+5494*x^12-3122*x^11-4720*x^10+8300*x^9-6582*x^8-9908*x^7-15983*x^6-5802*x^5-8634*x^4+7899*x^3+10556*x^2+6931*x+11063;
g=-10168*x^20+6674*x^19+3004*x^18+13113*x^17+9449*x^16+9097*x^15-6420*x^14+50*x^13+434*x^12-15226*x^11+3727*x^10-14065*x^9-9751*x^8-15792*x^7+6004*x^6-5059*x^5+2479*x^4-12504*x^3-11328*x^2-11338*x-8280;

simplifyGcd(f, g);

f=3812*x^22-6874*x^21+12586*x^20+3003*x^19-9568*x^18+11117*x^17 +7524*x^16+11138*x^15-9743*x^14+1892*x^13+12485*x^12-569*x^11-8265*x^10-5991*x^9+13701*x^8+2644*x^7-3936*x^6-15875*x^5+1289*x^4+3956*x^3-10099*x^2-6616*x+5401;
g=10652*x^20-4144*x^19-11810*x^18+8237*x^17-8675*x^16+6545*x^15-3601*x^14+14559*x^13+8090*x^12-8378*x^11+14255*x^10+8767*x^9-13932*x^8+11602*x^7-10751*x^6-4899*x^5+8637*x^4+14084*x^3-11583*x^2+5882*x+885;

simplifyGcd(f, g);

f=3812*x^22-6874*x^21+12586*x^20+3003*x^19-9568*x^18+11117*x^17+7524*x^16+11138*x^15-9743*x^14+1892*x^13+12485*x^12-569*x^11-8265*x^10-5991*x^9+13701*x^8+2644*x^7-3936*x^6-15875*x^5+1289*x^4+3956*x^3-10099*x^2-6616*x+5401;

g=10652*x^20-4144*x^19-11810*x^18+8237*x^17-8675*x^16+6545*x^15-3601*x^14+14559*x^13+8090*x^12-8378*x^11+14255*x^10+8767*x^9-13932*x^8+11602*x^7-10751*x^6-4899*x^5+8637*x^4+14084*x^3-11583*x^2+5882*x+885;

simplifyGcd(f,g);

f=-7448*x^36+7714*x^35-13927*x^34+3932*x^33+3682*x^32-10010*x^31+5268*x^30+13873*x^29+13357*x^28-833*x^27-184*x^26+15676*x^25+13250*x^24-1501*x^23+4047*x^22-12971*x^21+1837*x^20-95*x^19+13420*x^18+6133*x^17+1202*x^16-10228*x^15+15007*x^14-5205*x^13+5458*x^12+11076*x^11-488*x^10-9898*x^9+7409*x^8+13329*x^7-11898*x^6-7619*x^5-8536*x^4+12785*x^3+11896*x^2-12853*x+2549;

g=5104*x^34-12263*x^33-1609*x^32-6796*x^31-2994*x^30+7028*x^29-3014*x^28-1266*x^27-12321*x^26+14482*x^25+3663*x^24-3726*x^23+6983*x^22+1260*x^21-4850*x^20-2975*x^19+11044*x^18-14330*x^17-6739*x^16-11849*x^15+1213*x^14+3785*x^13+4837*x^12-11046*x^11+13804*x^10+8188*x^9+8122*x^8+10487*x^7+6814*x^6+9533*x^5-11550*x^4-10878*x^3-699*x^2-14751*x+3845;

simplifyGcd(f,g);

f=-11183*x^46+8215*x^45-14295*x^44+8289*x^43-7550*x^42+12650*x^41+10826*x^40-2442*x^39+6380*x^38-1209*x^37+1942*x^36+2715*x^35+15876*x^34+15415*x^33+6777*x^32-12712*x^31+12435*x^30-3063*x^29+10219*x^28-11110*x^27+7832*x^26-5236*x^25-12353*x^24+5050*x^23-1811*x^22+6642*x^21-3090*x^20-7071*x^19-12500*x^18+12953*x^17-10539*x^16+12938*x^15+8080*x^14+8451*x^13-9123*x^12-4021*x^11+4501*x^10-4506*x^9-407*x^8+12356*x^7-2074*x^6+690*x^5-14676*x^4-15971*x^3-1813*x^2+7707*x+1079;

g=183*x^45+5561*x^44-1043*x^43+12612*x^42+1596*x^41-9268*x^40+4858*x^39-13517*x^38+14465*x^37-12452*x^36-15117*x^35-5775*x^34-8520*x^33-13105*x^32-12192*x^31-4843*x^30-5194*x^29-2000*x^28+13734*x^27-4211*x^26+6154*x^25+3930*x^24+11156*x^23+5575*x^22+12497*x^21+3708*x^20-13561*x^19+6457*x^18+7867*x^17+11794*x^16-13102*x^15+3546*x^14+11013*x^13+6443*x^12+9411*x^11-5881*x^10-11560*x^9+13919*x^8-2613*x^7+10716*x^6+10107*x^5-7507*x^4-14638*x^3-9884*x^2-4890*x-2671;

simplifyGcd(f,g);

f=2229*x^56+11515*x^55+5449*x^54-2102*x^53+10553*x^52+4459*x^51 -10713*x^50-10483*x^49+12815*x^48+1371*x^47+13136*x^46+13474*x^45 +15930*x^44-3951*x^43+3632*x^42+5483*x^41+15429*x^40+11158*x^39 +11618*x^38-11397*x^37+373*x^36+12655*x^35-14103*x^34-9976*x^33 -4906*x^32+10959*x^31-6889*x^30-4713*x^29-9677*x^28-12594*x^27 +6918*x^26-12226*x^25+3225*x^24+9437*x^23-9869*x^22-10191*x^21 -2477*x^20+11187*x^19+5746*x^18-15428*x^17+4405*x^16-1631*x^15 -13687*x^14-6654*x^13+8104*x^12+12147*x^11-4629*x^10+5415*x^9 +5461*x^8+14494*x^7-2563*x^6+9079*x^5+12571*x^4-3643*x^3-10904*x^2 -7490*x-6782;

g=2877*x^61-351*x^60-12672*x^59-7991*x^58-2499*x^57-9709*x^56 +1219*x^55+5355*x^54-13710*x^53+3347*x^52-12542*x^51+12524*x^50 +8280*x^49+15488*x^48+13565*x^47+14659*x^46+9784*x^45+3738*x^44 +13042*x^43-2627*x^42-15378*x^41+7650*x^40-827*x^39-7590*x^38 +2687*x^37+15016*x^36+12855*x^35-8645*x^34+3930*x^33+1837*x^32 +335*x^31-11981*x^30-4414*x^29-7074*x^28+2715*x^27+3314*x^26-44*x^25 +8932*x^24+15583*x^23-2036*x^22-9074*x^21+9396*x^20+13732*x^19 -6178*x^18+2091*x^17+14186*x^16-7830*x^15+12864*x^14-583*x^13 -3809*x^12-5495*x^11+15730*x^10-9216*x^9+15330*x^8-12277*x^7-2666*x^6 -786*x^5-11567*x^4-6166*x^3-3486*x^2-3245*x-3393;

simplifyGcd(f,g);

//
// - ring r2=(32003,a),x,dp; minpoly=a^4+8734*a^3+a^2+11817*a+1.
//

tst_ignore( "ring r2=(32003,a),x,dp;" );
ring r2=(32003,a),x,dp;
minpoly=a^4+8734*a^3+a^2+11817*a+1;

poly f;
poly g;

// first, some of the r1 examples

f=3812*x^22-6874*x^21+12586*x^20+3003*x^19-9568*x^18+11117*x^17+7524*x^16+11138*x^15-9743*x^14+1892*x^13+12485*x^12-569*x^11-8265*x^10-5991*x^9+13701*x^8+2644*x^7-3936*x^6-15875*x^5+1289*x^4+3956*x^3-10099*x^2-6616*x+5401;

g=10652*x^20-4144*x^19-11810*x^18+8237*x^17-8675*x^16+6545*x^15-3601*x^14+14559*x^13+8090*x^12-8378*x^11+14255*x^10+8767*x^9-13932*x^8+11602*x^7-10751*x^6-4899*x^5+8637*x^4+14084*x^3-11583*x^2+5882*x+885;

simplifyGcd(f,g);

f=-7448*x^36+7714*x^35-13927*x^34+3932*x^33+3682*x^32-10010*x^31+5268*x^30+13873*x^29+13357*x^28-833*x^27-184*x^26+15676*x^25+13250*x^24-1501*x^23+4047*x^22-12971*x^21+1837*x^20-95*x^19+13420*x^18+6133*x^17+1202*x^16-10228*x^15+15007*x^14-5205*x^13+5458*x^12+11076*x^11-488*x^10-9898*x^9+7409*x^8+13329*x^7-11898*x^6-7619*x^5-8536*x^4+12785*x^3+11896*x^2-12853*x+2549;

g=5104*x^34-12263*x^33-1609*x^32-6796*x^31-2994*x^30+7028*x^29-3014*x^28-1266*x^27-12321*x^26+14482*x^25+3663*x^24-3726*x^23+6983*x^22+1260*x^21-4850*x^20-2975*x^19+11044*x^18-14330*x^17-6739*x^16-11849*x^15+1213*x^14+3785*x^13+4837*x^12-11046*x^11+13804*x^10+8188*x^9+8122*x^8+10487*x^7+6814*x^6+9533*x^5-11550*x^4-10878*x^3-699*x^2-14751*x+3845;

simplifyGcd(f,g);

// now, examples involving the algebraic variable
f=(4338*a^3*x^22+30273*a^2*x^22+23626*a*x^22+28673*x^22+2688*a^3*x^21+18069*a^2*x^21+615*a*x^21+11551*x^21+23638*a^3*x^20+20268*a^2*x^20+20021*a*x^20+6060*x^20+15921*a^3*x^19+10779*a^2*x^19+5367*a*x^19+13257*x^19+23678*a^3*x^18+21957*a^2*x^18+22070*a*x^18+13372*x^18+22158*a^3*x^17+22426*a^2*x^17+27501*a*x^17+8746*x^17+13959*a^3*x^16+6774*a^2*x^16+2671*a*x^16+7421*x^16+14110*a^3*x^15+28074*a^2*x^15+31056*a*x^15+9720*x^15+25856*a^3*x^14+27097*a^2*x^14+11589*a*x^14+9779*x^14+28980*a^3*x^13+31376*a^2*x^13+24496*a*x^13+2505*x^13+5276*a^3*x^12+643*a^2*x^12+25052*a*x^12+2373*x^12+5591*a^3*x^11+20901*a^2*x^11+25344*a*x^11+28303*x^11+10490*a^3*x^10+11510*a^2*x^10+30069*a*x^10+26527*x^10+23272*a^3*x^9+6872*a^2*x^9+20576*a*x^9+26446*x^9+20162*a^3*x^8+6455*a^2*x^8+13121*a*x^8+3588*x^8+6763*a^3*x^7+9099*a^2*x^7+13479*a*x^7+31228*x^7+12100*a^3*x^6+8734*a^2*x^6+17132*a*x^6+11923*x^6);

g=(21796*a^3*x^21+23013*a^2*x^21+19320*a*x^21+16794*x^21+15777*a^3*x^20+10745*a^2*x^20+18575*a*x^20+14270*x^20+21816*a^3*x^19+8096*a^2*x^19+22632*a*x^19+2859*x^19+11970*a^3*x^18+13157*a^2*x^18+21826*a*x^18+17544*x^18+22237*a^3*x^17+23414*a^2*x^17+28069*a*x^17+21121*x^17+20441*a^3*x^16+23414*a^2*x^16+17132*a*x^16+19928*x^16+4814*a^3*x^15+31789*a^2*x^15+26593*a*x^15+20904*x^15+2605*a^3*x^14+24991*a^2*x^14+19457*a*x^14+27354*x^14+7054*a^3*x^13+13551*a^2*x^13+8720*a*x^13+11331*x^13+20837*a^3*x^12+25525*a^2*x^12+12680*a*x^12+23860*x^12+17788*a^3*x^11+16365*a^2*x^11+20606*a*x^11+8950*x^11+5879*a^3*x^10+11444*a^2*x^10+8086*a*x^10+28735*x^10+10518*a^3*x^9+21493*a^2*x^9+13526*a*x^9+5403*x^9+4629*a^3*x^8+26419*a^2*x^8+2255*a*x^8+29703*x^8+21943*a^3*x^7+22203*a^2*x^7+10505*a*x^7+31699*x^7+25572*a^3*x^6+1423*a^2*x^6+25883*a*x^6+11415*x^6);

simplifyGcd(f,g);

f=(30402*a^2*x^11+18403*a^3*x^10+1601*a*x^10+7960*a^3*x^9+5100*a^2*x^9+12917*a*x^9+23503*x^9+19710*a^3*x^8+19683*a^2*x^8+5001*a*x^8+13321*x^8+8701*a^3*x^7+4852*a^2*x^7+7827*a*x^7+19791*x^7+31927*a^3*x^6+5410*a^2*x^6+5467*a*x^6+16037*x^6+17185*a^3*x^5+8307*a^2*x^5+19811*a*x^5+10473*x^5+19945*a^3*x^4+21657*a^2*x^4+10273*a*x^4+23983*x^4);

g=(21403*a^3*x^22+7448*a^2*x^22+10810*a*x^22+21081*x^22+704*a^3*x^21+5272*a^2*x^21+17829*a*x^21+16706*x^21+10892*a^3*x^20+1510*a^2*x^20+15586*a*x^20+2137*x^20+11244*a^3*x^19+10003*a^2*x^19+3058*a*x^19+19748*x^19+12837*a^3*x^18+8949*a^2*x^18+2293*a*x^18+23488*x^18+29674*a^3*x^17+3512*a^2*x^17+18761*a*x^17+23333*x^17+22922*a^3*x^16+25227*a^2*x^16+12018*a*x^16+16378*x^16+8276*a^3*x^15+11474*a^2*x^15+976*a*x^15+5711*x^15+28827*a^3*x^14+562*a^2*x^14+14734*a*x^14+1896*x^14+21302*a^3*x^13+5155*a^2*x^13+10181*a*x^13+11503*x^13+10353*a^3*x^12+8770*a^2*x^12+16539*a*x^12+21667*x^12+4499*a^3*x^11+28026*a^2*x^11+3189*a*x^11+6258*x^11+27740*a^3*x^10+29513*a^2*x^10+19135*a*x^10+31028*x^10+10383*a^3*x^9+1093*a^2*x^9+10434*a*x^9+9615*x^9+8069*a^3*x^8+8198*a^2*x^8+24314*a*x^8+31073*x^8+2167*a^3*x^7+4389*a^2*x^7+3275*a*x^7+31051*x^7+12541*a^3*x^6+19566*a^2*x^6+2389*a*x^6+25016*x^6);

simplifyGcd(f,g);

f=(6932*a^3*x^30+8805*a^2*x^30+5025*a*x^30+10521*x^30+13279*a^3*x^29+23946*a^2*x^29+27819*a*x^29+10032*x^29+2815*a^3*x^28+8075*a^2*x^28+10956*a*x^28+6853*x^28+14883*a^3*x^27+24295*a^2*x^27+2927*a*x^27+4389*x^27+23314*a^3*x^26+16933*a^2*x^26+10692*a*x^26+26362*x^26+9650*a^3*x^25+25794*a^2*x^25+31656*a*x^25+5294*x^25+4194*a^3*x^24+22900*a^2*x^24+219*a*x^24+7145*x^24+30606*a^3*x^23+1584*a^2*x^23+20182*a*x^23+19601*x^23+2310*a^3*x^22+16413*a^2*x^22+22745*a*x^22+23328*x^22+6311*a^3*x^21+16014*a^2*x^21+29004*a*x^21+3675*x^21+22006*a^3*x^20+19717*a^2*x^20+31090*a*x^20+15989*x^20+27117*a^3*x^19+29878*a^2*x^19+29895*a*x^19+10204*x^19+3117*a^3*x^18+1944*a^2*x^18+29310*a*x^18+10935*x^18+10617*a^3*x^17+16150*a^2*x^17+13962*a*x^17+29419*x^17+16368*a^3*x^16+27265*a^2*x^16+11482*a*x^16+2769*x^16+26177*a^3*x^15+19647*a^2*x^15+19994*a*x^15+5812*x^15+21191*a^3*x^14+2344*a^2*x^14+8122*a*x^14+18768*x^14+31816*a^3*x^13+22070*a^2*x^13+21686*a*x^13+9954*x^13+5285*a^3*x^12+28355*a^2*x^12+21554*a*x^12+15017*x^12+20844*a^3*x^11+22880*a^2*x^11+29139*a*x^11+10198*x^11+22187*a^3*x^10+1845*a^2*x^10+124*a*x^10+20875*x^10+23655*a^3*x^9+27689*a^2*x^9+462*a*x^9+9921*x^9+27553*a^3*x^8+4227*a^2*x^8+14891*a*x^8+28692*x^8+15422*a^3*x^7+18364*a^2*x^7+6643*a*x^7+9238*x^7);

g=(10159*a^3*x^31+16131*a^2*x^31+13528*a*x^31+23305*x^31+16104*a^3*x^30+31322*a^2*x^30+15822*a*x^30+15332*x^30+6117*a^3*x^29+22754*a^2*x^29+22263*a*x^29+15247*x^29+21262*a^3*x^28+21290*a^2*x^28+22581*a*x^28+19917*x^28+11941*a^3*x^27+14500*a^2*x^27+752*a*x^27+22628*x^27+20010*a^3*x^26+2870*a^2*x^26+4997*a*x^26+31196*x^26+435*a^3*x^25+10675*a^2*x^25+19556*a*x^25+8954*x^25+6160*a^3*x^24+8179*a^2*x^24+13464*a*x^24+5133*x^24+10300*a^3*x^23+16922*a^2*x^23+10977*a*x^23+8282*x^23+26357*a^3*x^22+29916*a^2*x^22+6574*a*x^22+27270*x^22+2454*a^3*x^21+18575*a^2*x^21+14149*a*x^21+19814*x^21+5816*a^3*x^20+25575*a^2*x^20+6813*a*x^20+7745*x^20+25535*a^3*x^19+29450*a^2*x^19+8899*a*x^19+29544*x^19+26603*a^3*x^18+8490*a^2*x^18+28259*a*x^18+19936*x^18+28599*a^3*x^17+9111*a^2*x^17+1453*a*x^17+29481*x^17+18730*a^3*x^16+6899*a^2*x^16+28194*a*x^16+23953*x^16+31494*a^3*x^15+2138*a^2*x^15+15148*a*x^15+22737*x^15+25852*a^3*x^14+10731*a^2*x^14+16293*a*x^14+13075*x^14+15602*a^3*x^13+11381*a^2*x^13+28493*a*x^13+27161*x^13+7432*a^3*x^12+20270*a^2*x^12+13437*a*x^12+313*x^12+12468*a^3*x^11+29981*a^2*x^11+28662*a*x^11+24642*x^11+11738*a^3*x^10+21558*a^2*x^10+20076*a*x^10+27087*x^10+18698*a^3*x^9+31594*a^2*x^9+3443*a*x^9+9974*x^9+9534*a^3*x^8+13115*a^2*x^8+11104*a*x^8+552*x^8+6650*a^3*x^7+20291*a^2*x^7+26968*a*x^7+14024*x^7+23978*a^3*x^6+20409*a^2*x^6+19489*a*x^6+30389*x^6);

simplifyGcd(f,g);

f=(3942*a^3*x^23+29103*a^2*x^23+12041*a*x^23+25126*x^23+20894*a^3*x^22+28895*a^2*x^22+11505*a*x^22+17368*x^22+13062*a^3*x^21+2762*a^2*x^21+21062*a*x^21+4750*x^21+23462*a^3*x^20+20870*a^2*x^20+2409*a*x^20+29192*x^20+11569*a^3*x^19+16322*a^2*x^19+11901*a*x^19+8892*x^19+9555*a^3*x^18+15798*a^2*x^18+2183*a*x^18+28858*x^18+10484*a^3*x^17+29114*a^2*x^17+7236*a*x^17+23244*x^17+14649*a^3*x^16+23659*a^2*x^16+18881*a*x^16+7039*x^16+5085*a^3*x^15+1172*a^2*x^15+24012*a*x^15+6392*x^15+29778*a^3*x^14+20684*a^2*x^14+13249*a*x^14+6939*x^14+28402*a^3*x^13+20158*a^2*x^13+11735*a*x^13+15324*x^13+16418*a^3*x^12+13712*a^2*x^12+28773*a*x^12+10656*x^12+27721*a^3*x^11+31296*a^2*x^11+5580*a*x^11+19101*x^11+20442*a^3*x^10+24260*a^2*x^10+22045*a*x^10+15747*x^10+16325*a^3*x^9+23879*a^2*x^9+6065*a*x^9+17821*x^9+10614*a^3*x^8+18747*a^2*x^8+19984*a*x^8+31361*x^8+2092*a^3*x^7+12565*a^2*x^7+16373*a*x^7+22666*x^7+16051*a^3*x^6+5112*a^2*x^6+3568*a*x^6+31215*x^6+7049*a^3*x^5+3561*a^2*x^5+23340*a*x^5+7954*x^5);

g=(7790*a^3*x^31+10495*a^2*x^31+3298*a*x^31+22265*x^31+17500*a^3*x^30+10225*a^2*x^30+31566*a*x^30+912*x^30+5002*a^3*x^29+3880*a^2*x^29+5880*a*x^29+27490*x^29+10868*a^3*x^28+31164*a^2*x^28+29132*a*x^28+719*x^28+629*a^3*x^27+21530*a^2*x^27+28414*a*x^27+5748*x^27+18413*a^3*x^26+22024*a^2*x^26+2681*a*x^26+26497*x^26+29395*a^3*x^25+14381*a^2*x^25+23428*a*x^25+6567*x^25+15793*a^3*x^24+9976*a^2*x^24+31655*a*x^24+24728*x^24+22812*a^3*x^23+26206*a^2*x^23+6912*a*x^23+7265*x^23+17258*a^3*x^22+30267*a^2*x^22+25929*a*x^22+16493*x^22+12895*a^3*x^21+15734*a^2*x^21+29806*a*x^21+20282*x^21+14651*a^3*x^20+12822*a^2*x^20+12802*a*x^20+31183*x^20+51*a^3*x^19+25722*a^2*x^19+26227*a*x^19+27737*x^19+14804*a^3*x^18+255*a^2*x^18+24186*a*x^18+14659*x^18+10845*a^3*x^17+27841*a^2*x^17+15018*a*x^17+15319*x^17+22625*a^3*x^16+17940*a^2*x^16+13545*a*x^16+29977*x^16+12035*a^3*x^15+11966*a^2*x^15+20021*a*x^15+6*x^15+28097*a^3*x^14+6249*a^2*x^14+14666*a*x^14+22252*x^14+24456*a^3*x^13+12304*a^2*x^13+1870*a*x^13+26782*x^13+16348*a^3*x^12+25937*a^2*x^12+21062*a*x^12+9052*x^12+20170*a^3*x^11+14401*a^2*x^11+4713*a*x^11+9405*x^11+18164*a^3*x^10+292*a^2*x^10+9410*a*x^10+25268*x^10+2490*a^3*x^9+6288*a^2*x^9+28090*a*x^9+9720*x^9+13228*a^3*x^8+22541*a^2*x^8+19371*a*x^8+15795*x^8+1988*a^3*x^7+22172*a^2*x^7+14147*a*x^7+22800*x^7+11858*a^3*x^6+21917*a^2*x^6+21057*a*x^6+4514*x^6+97*a^3*x^5+14373*a^2*x^5+18053*a*x^5+6456*x^5);

simplifyGcd(f,g);

f=(30992*a^3*x^58+22948*a^2*x^58+10015*a*x^58+1073*x^58+18314*a^3*x^57+20073*a^2*x^57+22488*a*x^57+9402*x^57+17300*a^3*x^56+14831*a^2*x^56+26887*a*x^56+4935*x^56+26115*a^3*x^55+12934*a^2*x^55+20509*a*x^55+918*x^55+2507*a^3*x^54+5388*a^2*x^54+1772*a*x^54+28695*x^54+10945*a^3*x^53+4883*a^2*x^53+10536*a*x^53+24376*x^53+27275*a^3*x^52+14030*a^2*x^52+22660*a*x^52+21483*x^52+26646*a^3*x^51+10827*a^2*x^51+5408*a*x^51+17539*x^51+28027*a^3*x^50+2173*a^2*x^50+2283*a*x^50+11199*x^50+21879*a^3*x^49+29075*a^2*x^49+27564*a*x^49+26453*x^49+12193*a^3*x^48+23514*a^2*x^48+26819*a*x^48+19138*x^48+2586*a^3*x^47+3548*a^2*x^47+4181*a*x^47+31616*x^47+1166*a^3*x^46+4516*a^2*x^46+28352*a*x^46+11078*x^46+6154*a^3*x^45+31935*a^2*x^45+5097*a*x^45+12528*x^45+12919*a^3*x^44+25456*a^2*x^44+22681*a*x^44+8896*x^44+31045*a^3*x^43+24933*a^2*x^43+31089*a*x^43+4350*x^43+8333*a^3*x^42+22706*a^2*x^42+13*a*x^42+27625*x^42+1543*a^3*x^41+12183*a^2*x^41+6605*a*x^41+8748*x^41+4405*a^3*x^40+12876*a^2*x^40+6643*a*x^40+6818*x^40+23398*a^3*x^39+7637*a^2*x^39+17594*a*x^39+28548*x^39+9946*a^3*x^38+26913*a^2*x^38+12163*a*x^38+12432*x^38+20206*a^3*x^37+28123*a^2*x^37+27122*a*x^37+714*x^37+8552*a^3*x^36+4912*a^2*x^36+28324*a*x^36+10002*x^36+20129*a^3*x^35+3836*a^2*x^35+8003*a*x^35+28851*x^35+31693*a^3*x^34+28313*a^2*x^34+28756*a*x^34+866*x^34+16979*a^3*x^33+1241*a^2*x^33+13541*a*x^33+15837*x^33+11228*a^3*x^32+20746*a^2*x^32+29871*a*x^32+8014*x^32+421*a^3*x^31+25890*a^2*x^31+17989*a*x^31+12752*x^31+2877*a^3*x^30+27001*a^2*x^30+27903*a*x^30+10401*x^30+26701*a^3*x^29+26470*a^2*x^29+18273*a*x^29+15917*x^29+27051*a^3*x^28+25885*a^2*x^28+5757*a*x^28+22254*x^28+16901*a^3*x^27+15683*a^2*x^27+494*a*x^27+8580*x^27+9662*a^3*x^26+31031*a^2*x^26+6613*a*x^26+28791*x^26+14952*a^3*x^25+22011*a^2*x^25+159*a*x^25+30050*x^25+15689*a^3*x^24+11636*a^2*x^24+16643*a*x^24+11419*x^24+23851*a^3*x^23+6932*a^2*x^23+26864*a*x^23+22734*x^23+8225*a^3*x^22+7001*a^2*x^22+15435*a*x^22+19011*x^22+5589*a^3*x^21+31994*a^2*x^21+15741*a*x^21+7547*x^21+23329*a^3*x^20+2414*a^2*x^20+19361*a*x^20+8871*x^20+16038*a^3*x^19+27673*a^2*x^19+31205*a*x^19+28802*x^19+503*a^3*x^18+16146*a^2*x^18+11951*a*x^18+27659*x^18+5568*a^3*x^17+20655*a^2*x^17+10175*a*x^17+7756*x^17);

g=(9770*a^3*x^59+23847*a^2*x^59+6476*a*x^59+6123*x^59+8421*a^3*x^58+1072*a^2*x^58+22097*a*x^58+29093*x^58+117*a^3*x^57+16911*a^2*x^57+18234*a*x^57+927*x^57+23772*a^3*x^56+22082*a^2*x^56+31256*a*x^56+20032*x^56+31604*a^3*x^55+2212*a^2*x^55+26550*a*x^55+21031*x^55+27901*a^3*x^54+9601*a^2*x^54+27259*a*x^54+26967*x^54+10891*a^3*x^53+9321*a^2*x^53+16017*a*x^53+11268*x^53+19635*a^3*x^52+22384*a^2*x^52+26394*a*x^52+9188*x^52+30422*a^3*x^51+7923*a^2*x^51+4253*a*x^51+27959*x^51+29878*a^3*x^50+31200*a^2*x^50+3950*a*x^50+5908*x^50+21728*a^3*x^49+17068*a^2*x^49+12530*a*x^49+27968*x^49+8548*a^3*x^48+14100*a^2*x^48+3133*a*x^48+14435*x^48+9732*a^3*x^47+25047*a^2*x^47+6513*a*x^47+8842*x^47+2627*a^3*x^46+9720*a^2*x^46+16557*a*x^46+14683*x^46+528*a^3*x^45+19121*a^2*x^45+9027*a*x^45+26620*x^45+30387*a^3*x^44+9802*a^2*x^44+3749*a*x^44+13517*x^44+2453*a^3*x^43+14699*a^2*x^43+19919*a*x^43+21225*x^43+28310*a^3*x^42+4499*a^2*x^42+3955*a*x^42+7682*x^42+26192*a^3*x^41+3875*a^2*x^41+18658*a*x^41+14678*x^41+23520*a^3*x^40+20042*a^2*x^40+10533*a*x^40+23098*x^40+3162*a^3*x^39+9685*a^2*x^39+15412*a*x^39+10106*x^39+8206*a^3*x^38+29658*a^2*x^38+17362*a*x^38+25937*x^38+12646*a^3*x^37+11011*a^2*x^37+28535*a*x^37+5519*x^37+3154*a^3*x^36+4244*a^2*x^36+28825*a*x^36+5374*x^36+28302*a^3*x^35+1136*a^2*x^35+16491*a*x^35+12998*x^35+30512*a^3*x^34+22305*a^2*x^34+26506*a*x^34+16012*x^34+17373*a^3*x^33+17704*a^2*x^33+24901*a*x^33+2583*x^33+3047*a^3*x^32+15647*a^2*x^32+20674*a*x^32+12458*x^32+17540*a^3*x^31+9355*a^2*x^31+19841*a*x^31+2413*x^31+3035*a^3*x^30+16099*a^2*x^30+20919*a*x^30+24963*x^30+6799*a^3*x^29+31086*a^2*x^29+11471*a*x^29+4081*x^29+423*a^3*x^28+7304*a^2*x^28+4181*a*x^28+16071*x^28+16654*a^3*x^27+19898*a^2*x^27+8695*a*x^27+29767*x^27+12283*a^3*x^26+30100*a^2*x^26+1878*a*x^26+21685*x^26+19555*a^3*x^25+19749*a^2*x^25+10671*a*x^25+17764*x^25+21311*a^3*x^24+16481*a^2*x^24+3963*a*x^24+6023*x^24+31590*a^3*x^23+22987*a^2*x^23+13610*a*x^23+23584*x^23+16875*a^3*x^22+23911*a^2*x^22+27572*a*x^22+27474*x^22+8657*a^3*x^21+18438*a^2*x^21+31480*a*x^21+16007*x^21+10748*a^3*x^20+19771*a^2*x^20+12922*a*x^20+25108*x^20+10465*a^3*x^19+25448*a^2*x^19+1174*a*x^19+13826*x^19+26840*a^3*x^18+31447*a^2*x^18+18936*a*x^18+17117*x^18+1648*a^3*x^17+22711*a^2*x^17+21403*a*x^17+24208*x^17+7784*a^3*x^16+3055*a^2*x^16+11088*a*x^16+13963*x^16);

simplifyGcd(f,g);

//
// - ring r3=(32003,a,c,e),(f,h,k),dp.
//

tst_ignore( "ring r3=(32003,a,c,e),(f,h,k),dp;" );
ring r3=(32003,a,c,e),(f,h,k),dp;

poly fPoly;
poly gPoly;

fPoly=(10501*c^11*e^3*f^3*k^4+500*c^10*e^4*f^2*k^5+12001*c^10*e^3*f^4*h*k^3-500*c^9*e^5*f*k^6-14501*c^9*e^4*f^3*h*k^4-3500*c^9*e^3*f^5*h^2*k^2-10501*c^8*e^6*k^7+4000*c^8*e^5*f^2*h*k^5+7000*c^8*e^4*f^4*h^2*k^3-7001*c^8*e^3*f^6*h^3*k-12501*c^7*e^6*f*h*k^6-13501*c^7*e^5*f^3*h^2*k^4-12001*c^7*e^3*f^7*h^4+11001*c^6*e^7*h*k^7+9001*c^6*e^6*f^2*h^2*k^5+13002*c^6*e^5*f^4*h^3*k^3+3001*c^6*e^4*f^6*h^4*k+1000*c^5*e^7*f*h^2*k^6+14002*c^5*e^6*f^3*h^3*k^4-7001*c^5*e^5*f^5*h^4*k^2+4000*c^5*e^4*f^7*h^5-4003*c^4*e^7*f^2*h^3*k^5+7997*c^4*e^6*f^4*h^4*k^3-12002*c^4*e^5*f^6*h^5*k+2*c^3*e^8*f*h^3*k^6-7995*c^3*e^7*f^3*h^4*k^4-7997*c^3*e^6*f^5*h^5*k^2-16001*c^3*e^5*f^7*h^6+16001*c^2*e^9*h^3*k^7-3*c^2*e^8*f^2*h^4*k^5+15998*c^2*e^7*f^4*h^5*k^3-c^2*e^6*f^6*h^6*k-16001*c*e^9*f*h^4*k^6+c*e^8*f^3*h^5*k^4-16001*c*e^7*f^5*h^6*k^2);

gPoly=(10501*c^9*f^8*k^4+500*c^8*e*f^7*k^5-9001*c^8*f^9*h*k^3-500*c^7*e^2*f^6*k^6+15002*c^7*e*f^8*h*k^4-5500*c^7*f^10*h^2*k^2-10501*c^6*e^3*f^5*k^7+9000*c^6*e^2*f^7*h*k^5-7503*c^6*e*f^9*h^2*k^3-4001*c^6*f^11*h^3*k+5001*c^5*e^3*f^6*h*k^6-496*c^5*e^2*f^8*h^2*k^4+3*c^5*e*f^10*h^3*k^2+8001*c^5*f^12*h^4+12001*c^4*e^4*f^5*h*k^7+5497*c^4*e^3*f^7*h^2*k^5+7995*c^4*e^2*f^9*h^3*k^3-8002*c^4*e*f^11*h^4*k-16000*c^3*e^4*f^6*h^2*k^6-15996*c^3*e^3*f^8*h^3*k^4-15999*c^3*e^2*f^10*h^4*k^2-8001*c^2*e^5*f^5*h^2*k^7-4003*c^2*e^4*f^7*h^3*k^5+15999*c^2*e^3*f^9*h^4*k^3-16001*c*e^5*f^6*h^3*k^6+8002*c*e^4*f^8*h^4*k^4-8001*e^5*f^7*h^4*k^5);

simplifyGcd(fPoly, gPoly);

fPoly=(8001*a*c^10*e^2*f^4*k^4+16001*a*c^9*e^3*f^3*k^5+15999*a*c^9*e^2*f^5*h*k^3+8001*a*c^8*e^4*f^2*k^6+7*a*c^8*e^3*f^4*h*k^4+8009*a*c^8*e^2*f^6*h^2*k^2+15995*a*c^7*e^4*f^3*h*k^5+15973*a*c^7*e^3*f^5*h^2*k^3-10*a*c^7*e^2*f^7*h^3*k+2*a*c^6*e^5*f^2*h*k^6+8037*a*c^6*e^4*f^4*h^2*k^4+38*a*c^6*e^3*f^6*h^3*k^2+4*a*c^6*e^2*f^8*h^4-20*a*c^5*e^5*f^3*h^2*k^5-54*a*c^5*e^4*f^5*h^3*k^3-16*a*c^5*e^3*f^7*h^4*k+4*a*c^4*e^6*f^2*h^2*k^6+34*a*c^4*e^5*f^4*h^3*k^4+24*a*c^4*e^4*f^6*h^4*k^2-8*a*c^3*e^6*f^3*h^3*k^5-16*a*c^3*e^5*f^5*h^4*k^3+4*a*c^2*e^6*f^4*h^4*k^4);

gPoly=(8001*c^11*f^5*k^4+8000*c^10*e*f^4*k^5+15999*c^10*f^6*h*k^3-8000*c^9*e^2*f^3*k^6-15992*c^9*e*f^5*h*k^4+8009*c^9*f^7*h^2*k^2-8001*c^8*e^3*f^2*k^7+15988*c^8*e^2*f^4*h*k^5+7964*c^8*e*f^6*h^2*k^3-10*c^8*f^8*h^3*k-15993*c^7*e^3*f^3*h*k^6-7936*c^7*e^2*f^5*h^2*k^4+48*c^7*e*f^7*h^3*k^2+4*c^7*f^9*h^4-2*c^6*e^4*f^2*h*k^7-8057*c^6*e^3*f^4*h^2*k^5-92*c^6*e^2*f^6*h^3*k^3-20*c^6*e*f^8*h^4*k+24*c^5*e^4*f^3*h^2*k^6+88*c^5*e^3*f^5*h^3*k^4+40*c^5*e^2*f^7*h^4*k^2-4*c^4*e^5*f^2*h^2*k^7-42*c^4*e^4*f^4*h^3*k^5-40*c^4*e^3*f^6*h^4*k^3+8*c^3*e^5*f^3*h^3*k^6+20*c^3*e^4*f^5*h^4*k^4-4*c^2*e^5*f^4*h^4*k^5);

simplifyGcd(fPoly, gPoly);

fPoly=(-8001*a^3*c^12*e*f^3*k^6-16000*a^3*c^11*e^2*f^2*k^7+3*a^3*c^11*e*f^4*h*k^5-2*a^3*c^10*e^3*f*k^8-8022*a^3*c^10*e^2*f^3*h*k^6+15988*a^3*c^10*e*f^5*h^2*k^4-15963*a^3*c^9*e^3*f^2*h*k^7-15889*a^3*c^9*e^2*f^4*h^2*k^5+29*a^3*c^9*e*f^6*h^3*k^3-16*a^3*c^8*e^4*f*h*k^8-250*a^3*c^8*e^3*f^3*h^2*k^6-8291*a^3*c^8*e^2*f^5*h^3*k^4-8033*a^3*c^8*e*f^7*h^4*k^2+174*a^3*c^7*e^4*f^2*h^2*k^7-15251*a^3*c^7*e^3*f^4*h^3*k^5-15593*a^3*c^7*e^2*f^6*h^4*k^3+18*a^3*c^7*e*f^8*h^5*k-32*a^3*c^6*e^5*f*h^2*k^8-664*a^3*c^6*e^4*f^3*h^3*k^6-1211*a^3*c^6*e^3*f^5*h^4*k^4-315*a^3*c^6*e^2*f^7*h^5*k^2-4*a^3*c^6*e*f^9*h^6+184*a^3*c^5*e^5*f^2*h^3*k^7+1278*a^3*c^5*e^4*f^4*h^4*k^5+1054*a^3*c^5*e^3*f^6*h^5*k^3+120*a^3*c^5*e^2*f^8*h^6*k-480*a^3*c^4*e^5*f^3*h^4*k^6-1260*a^3*c^4*e^4*f^5*h^5*k^4-444*a^3*c^4*e^3*f^7*h^6*k^2-16*a^3*c^4*e^2*f^9*h^7+32*a^3*c^3*e^6*f^2*h^4*k^7+568*a^3*c^3*e^5*f^4*h^5*k^5+568*a^3*c^3*e^4*f^6*h^6*k^3+64*a^3*c^3*e^3*f^8*h^7*k-64*a^3*c^2*e^6*f^3*h^5*k^6-272*a^3*c^2*e^5*f^5*h^6*k^4-80*a^3*c^2*e^4*f^7*h^7*k^2+32*a^3*c*e^6*f^4*h^6*k^5+32*a^3*c*e^5*f^6*h^7*k^3);

gPoly=(12001*c^14*k^8-15999*c^13*f*h*k^7-2*c^12*e*h*k^8+7980*c^12*f^2*h^2*k^6+32*c^11*e*f*h^2*k^7-15909*c^11*f^3*h^3*k^5-12*c^10*e^2*h^2*k^8-204*c^10*e*f^2*h^3*k^6+11761*c^10*f^4*h^4*k^4+144*c^9*e^2*f*h^3*k^7+664*c^9*e*f^3*h^4*k^5+370*c^9*f^5*h^5*k^3-32*c^8*e^3*h^3*k^8-648*c^8*e^2*f^2*h^4*k^6-1186*c^8*e*f^4*h^5*k^4-332*c^8*f^6*h^6*k^2+256*c^7*e^3*f*h^4*k^7+1392*c^7*e^2*f^3*h^5*k^5+1176*c^7*e*f^5*h^6*k^3+160*c^7*f^7*h^7*k-32*c^6*e^4*h^4*k^8-704*c^6*e^3*f^2*h^5*k^6-1548*c^6*e^2*f^4*h^6*k^4-608*c^6*e*f^6*h^7*k^2-32*c^6*f^8*h^8+128*c^5*e^4*f*h^5*k^7+896*c^5*e^3*f^3*h^6*k^5+864*c^5*e^2*f^5*h^7*k^3+128*c^5*e*f^7*h^8*k-192*c^4*e^4*f^2*h^6*k^6-544*c^4*e^3*f^4*h^7*k^4-192*c^4*e^2*f^6*h^8*k^2+128*c^3*e^4*f^3*h^7*k^5+128*c^3*e^3*f^5*h^8*k^3-32*c^2*e^4*f^4*h^8*k^4);

simplifyGcd(fPoly, gPoly);

fPoly=(-15939*a^2*c^18*e*f^5*k^10+15314*a^2*c^17*e^2*f^4*k^11-5813*a^2*c^17*e*f^6*h*k^9+12626*a^2*c^16*e^3*f^3*k^12-6189*a^2*c^16*e^2*f^5*h*k^10-13501*a^2*c^16*e*f^7*h^2*k^8+2938*a^2*c^15*e^4*f^2*k^13+6254*a^2*c^15*e^3*f^4*h*k^11-809*a^2*c^15*e^2*f^6*h^2*k^9+14497*a^2*c^15*e*f^8*h^3*k^7+6688*a^2*c^14*e^5*f*k^14+10933*a^2*c^14*e^4*f^3*h*k^12+2667*a^2*c^14*e^3*f^5*h^2*k^10-15807*a^2*c^14*e^2*f^7*h^3*k^8+12710*a^2*c^14*e*f^9*h^4*k^6+10376*a^2*c^13*e^6*k^15-11809*a^2*c^13*e^5*f^2*h*k^13+15983*a^2*c^13*e^4*f^4*h^2*k^11-7531*a^2*c^13*e^3*f^6*h^3*k^9-11595*a^2*c^13*e^2*f^8*h^4*k^7+7759*a^2*c^13*e*f^10*h^5*k^5-377*a^2*c^12*e^6*f*h*k^14-8237*a^2*c^12*e^5*f^3*h^2*k^12+12315*a^2*c^12*e^4*f^5*h^3*k^10+14837*a^2*c^12*e^3*f^7*h^4*k^8-2945*a^2*c^12*e^2*f^9*h^5*k^6-1669*a^2*c^12*e*f^11*h^6*k^4+7001*a^2*c^11*e^7*h*k^15-5095*a^2*c^11*e^6*f^2*h^2*k^13+15751*a^2*c^11*e^5*f^4*h^3*k^11-6433*a^2*c^11*e^4*f^6*h^4*k^9-1178*a^2*c^11*e^3*f^8*h^5*k^7+13741*a^2*c^11*e^2*f^10*h^6*k^5-6075*a^2*c^11*e*f^12*h^7*k^3-7011*a^2*c^10*e^7*f*h^2*k^14+9719*a^2*c^10*e^6*f^3*h^3*k^12+2122*a^2*c^10*e^5*f^5*h^4*k^10-7622*a^2*c^10*e^4*f^7*h^5*k^8-6837*a^2*c^10*e^3*f^9*h^6*k^6+496*a^2*c^10*e^2*f^11*h^7*k^4-7959*a^2*c^10*e*f^13*h^8*k^2-16000*a^2*c^9*e^8*h^2*k^15-4923*a^2*c^9*e^7*f^2*h^3*k^13+9471*a^2*c^9*e^6*f^4*h^4*k^11+9695*a^2*c^9*e^5*f^6*h^5*k^9-5510*a^2*c^9*e^4*f^8*h^6*k^7+10543*a^2*c^9*e^3*f^10*h^7*k^5+7714*a^2*c^9*e^2*f^12*h^8*k^3+15988*a^2*c^9*e*f^14*h^9*k-8022*a^2*c^8*e^8*f*h^3*k^14+2836*a^2*c^8*e^7*f^3*h^4*k^12+341*a^2*c^8*e^6*f^5*h^5*k^10+1267*a^2*c^8*e^5*f^7*h^6*k^8-5523*a^2*c^8*e^4*f^9*h^7*k^6-15137*a^2*c^8*e^3*f^11*h^8*k^4+94*a^2*c^8*e^2*f^13*h^9*k^2+2*a^2*c^8*e*f^15*h^10-15999*a^2*c^7*e^9*h^3*k^15+8068*a^2*c^7*e^8*f^2*h^4*k^13+1994*a^2*c^7*e^7*f^4*h^5*k^11-9422*a^2*c^7*e^6*f^6*h^6*k^9+7341*a^2*c^7*e^5*f^8*h^7*k^7+14503*a^2*c^7*e^4*f^10*h^8*k^5+15717*a^2*c^7*e^3*f^12*h^9*k^3-14*a^2*c^7*e^2*f^14*h^10*k-14*a^2*c^6*e^9*f*h^4*k^14-8072*a^2*c^6*e^8*f^3*h^5*k^12+487*a^2*c^6*e^7*f^5*h^6*k^10+9827*a^2*c^6*e^6*f^7*h^7*k^8-6364*a^2*c^6*e^5*f^9*h^8*k^6+489*a^2*c^6*e^4*f^11*h^9*k^4+42*a^2*c^6*e^3*f^13*h^10*k^2+a^2*c^5*e^10*h^4*k^15+33*a^2*c^5*e^9*f^2*h^5*k^13+7970*a^2*c^5*e^8*f^4*h^6*k^11+15252*a^2*c^5*e^7*f^6*h^7*k^9+6849*a^2*c^5*e^6*f^8*h^8*k^7+15479*a^2*c^5*e^5*f^10*h^9*k^5-70*a^2*c^5*e^4*f^12*h^10*k^3-5*a^2*c^4*e^10*f*h^5*k^14-36*a^2*c^4*e^9*f^3*h^6*k^12-15865*a^2*c^4*e^8*f^5*h^7*k^10+503*a^2*c^4*e^7*f^7*h^8*k^8+356*a^2*c^4*e^6*f^9*h^9*k^6+70*a^2*c^4*e^5*f^11*h^10*k^4+9*a^2*c^3*e^10*f^2*h^6*k^13-15989*a^2*c^3*e^9*f^4*h^7*k^11-117*a^2*c^3*e^8*f^6*h^8*k^9+15850*a^2*c^3*e^7*f^8*h^9*k^7-42*a^2*c^3*e^6*f^10*h^10*k^5-7*a^2*c^2*e^10*f^3*h^7*k^12+6*a^2*c^2*e^9*f^5*h^8*k^10+37*a^2*c^2*e^8*f^7*h^9*k^8+14*a^2*c^2*e^7*f^9*h^10*k^6+2*a^2*c*e^10*f^4*h^8*k^11-4*a^2*c*e^9*f^6*h^9*k^9-2*a^2*c*e^8*f^8*h^10*k^7);

gPoly=(-5313*c^17*e*f^3*k^13+5313*c^17*f^5*h*k^11+15939*c^16*e^2*f^2*k^14-5688*c^16*e*f^4*h*k^12-10251*c^16*f^6*h^2*k^10-15939*c^15*e^3*f*k^15-3813*c^15*e^2*f^3*h*k^13+1875*c^15*e*f^5*h^2*k^11-14126*c^15*f^7*h^3*k^9+5313*c^14*e^4*k^16-7563*c^14*e^3*f^2*h*k^14+7877*c^14*e^2*f^4*h^2*k^12-10376*c^14*e*f^6*h^3*k^10+4749*c^14*f^8*h^4*k^8-9251*c^13*e^4*f*h*k^15+5623*c^13*e^3*f^3*h^2*k^13-12131*c^13*e^2*f^5*h^3*k^11-13560*c^13*e*f^7*h^4*k^9-2684*c^13*f^9*h^5*k^7-11001*c^12*e^5*h*k^16+6878*c^12*e^4*f^2*h^2*k^14-8112*c^12*e^3*f^4*h^3*k^12+193*c^12*e^2*f^6*h^4*k^10-6954*c^12*e*f^8*h^5*k^8-13007*c^12*f^10*h^6*k^6-10002*c^11*e^5*f*h^2*k^15+12734*c^11*e^4*f^3*h^3*k^13-2722*c^11*e^3*f^5*h^4*k^11-12047*c^11*e^2*f^7*h^5*k^9+14032*c^11*e*f^9*h^6*k^7-1995*c^11*f^11*h^7*k^5-2000*c^10*e^6*h^2*k^16+8012*c^10*e^5*f^2*h^3*k^14+7371*c^10*e^4*f^4*h^4*k^12+713*c^10*e^3*f^6*h^5*k^10+7940*c^10*e^2*f^8*h^6*k^8-6032*c^10*e*f^10*h^7*k^6+15999*c^10*f^12*h^8*k^4+7997*c^9*e^6*f*h^3*k^15+15952*c^9*e^5*f^3*h^4*k^13+3916*c^9*e^4*f^5*h^5*k^11-7958*c^9*e^3*f^7*h^6*k^9+12079*c^9*e^2*f^9*h^7*k^7-15985*c^9*e*f^11*h^8*k^5-16001*c^9*f^13*h^9*k^3-16001*c^8*e^7*h^3*k^16-11978*c^8*e^6*f^2*h^4*k^14+9096*c^8*e^5*f^4*h^5*k^12-972*c^8*e^4*f^6*h^6*k^10+3903*c^8*e^3*f^8*h^7*k^8-46*c^8*e^2*f^10*h^8*k^6+15998*c^8*e*f^12*h^9*k^4+15996*c^7*e^7*f*h^4*k^15-8056*c^7*e^6*f^3*h^5*k^13+1925*c^7*e^5*f^5*h^6*k^11-9945*c^7*e^4*f^7*h^7*k^9-15932*c^7*e^3*f^9*h^8*k^7-15991*c^7*e^2*f^11*h^9*k^5-16001*c^6*e^8*h^4*k^16-15985*c^6*e^7*f^2*h^5*k^14-1942*c^6*e^6*f^4*h^6*k^12-13999*c^6*e^5*f^6*h^7*k^10-60*c^6*e^4*f^8*h^8*k^8+15984*c^6*e^3*f^10*h^9*k^6-2*c^5*e^8*f*h^5*k^15-21*c^5*e^7*f^3*h^6*k^13-22*c^5*e^6*f^5*h^7*k^11-15974*c^5*e^5*f^7*h^8*k^9-15984*c^5*e^4*f^9*h^9*k^7+3*c^4*e^8*f^2*h^6*k^14-15990*c^4*e^7*f^4*h^7*k^12-4*c^4*e^6*f^6*h^8*k^10+15991*c^4*e^5*f^8*h^9*k^8-2*c^3*e^8*f^3*h^7*k^13+16000*c^3*e^7*f^5*h^8*k^11-15998*c^3*e^6*f^7*h^9*k^9-16001*c^2*e^8*f^4*h^8*k^12+16001*c^2*e^7*f^6*h^9*k^10);

simplifyGcd(fPoly, gPoly);

//
// - ring r4=32003,(a,c,e,f,h,k),dp.
//
// The examples from r4 are those from r3 with parameters
// changed to ring variables.
//

tst_ignore( "ring r4=32003,(a,c,e,f,h,k),dp;" );
ring r4=32003,(a,c,e,f,h,k),dp;

poly fPoly;
poly gPoly;

fPoly=(10501*c^11*e^3*f^3*k^4+500*c^10*e^4*f^2*k^5+12001*c^10*e^3*f^4*h*k^3-500*c^9*e^5*f*k^6-14501*c^9*e^4*f^3*h*k^4-3500*c^9*e^3*f^5*h^2*k^2-10501*c^8*e^6*k^7+4000*c^8*e^5*f^2*h*k^5+7000*c^8*e^4*f^4*h^2*k^3-7001*c^8*e^3*f^6*h^3*k-12501*c^7*e^6*f*h*k^6-13501*c^7*e^5*f^3*h^2*k^4-12001*c^7*e^3*f^7*h^4+11001*c^6*e^7*h*k^7+9001*c^6*e^6*f^2*h^2*k^5+13002*c^6*e^5*f^4*h^3*k^3+3001*c^6*e^4*f^6*h^4*k+1000*c^5*e^7*f*h^2*k^6+14002*c^5*e^6*f^3*h^3*k^4-7001*c^5*e^5*f^5*h^4*k^2+4000*c^5*e^4*f^7*h^5-4003*c^4*e^7*f^2*h^3*k^5+7997*c^4*e^6*f^4*h^4*k^3-12002*c^4*e^5*f^6*h^5*k+2*c^3*e^8*f*h^3*k^6-7995*c^3*e^7*f^3*h^4*k^4-7997*c^3*e^6*f^5*h^5*k^2-16001*c^3*e^5*f^7*h^6+16001*c^2*e^9*h^3*k^7-3*c^2*e^8*f^2*h^4*k^5+15998*c^2*e^7*f^4*h^5*k^3-c^2*e^6*f^6*h^6*k-16001*c*e^9*f*h^4*k^6+c*e^8*f^3*h^5*k^4-16001*c*e^7*f^5*h^6*k^2);

gPoly=(10501*c^9*f^8*k^4+500*c^8*e*f^7*k^5-9001*c^8*f^9*h*k^3-500*c^7*e^2*f^6*k^6+15002*c^7*e*f^8*h*k^4-5500*c^7*f^10*h^2*k^2-10501*c^6*e^3*f^5*k^7+9000*c^6*e^2*f^7*h*k^5-7503*c^6*e*f^9*h^2*k^3-4001*c^6*f^11*h^3*k+5001*c^5*e^3*f^6*h*k^6-496*c^5*e^2*f^8*h^2*k^4+3*c^5*e*f^10*h^3*k^2+8001*c^5*f^12*h^4+12001*c^4*e^4*f^5*h*k^7+5497*c^4*e^3*f^7*h^2*k^5+7995*c^4*e^2*f^9*h^3*k^3-8002*c^4*e*f^11*h^4*k-16000*c^3*e^4*f^6*h^2*k^6-15996*c^3*e^3*f^8*h^3*k^4-15999*c^3*e^2*f^10*h^4*k^2-8001*c^2*e^5*f^5*h^2*k^7-4003*c^2*e^4*f^7*h^3*k^5+15999*c^2*e^3*f^9*h^4*k^3-16001*c*e^5*f^6*h^3*k^6+8002*c*e^4*f^8*h^4*k^4-8001*e^5*f^7*h^4*k^5);

simplifyGcd(fPoly, gPoly);

fPoly=(8001*a*c^10*e^2*f^4*k^4+16001*a*c^9*e^3*f^3*k^5+15999*a*c^9*e^2*f^5*h*k^3+8001*a*c^8*e^4*f^2*k^6+7*a*c^8*e^3*f^4*h*k^4+8009*a*c^8*e^2*f^6*h^2*k^2+15995*a*c^7*e^4*f^3*h*k^5+15973*a*c^7*e^3*f^5*h^2*k^3-10*a*c^7*e^2*f^7*h^3*k+2*a*c^6*e^5*f^2*h*k^6+8037*a*c^6*e^4*f^4*h^2*k^4+38*a*c^6*e^3*f^6*h^3*k^2+4*a*c^6*e^2*f^8*h^4-20*a*c^5*e^5*f^3*h^2*k^5-54*a*c^5*e^4*f^5*h^3*k^3-16*a*c^5*e^3*f^7*h^4*k+4*a*c^4*e^6*f^2*h^2*k^6+34*a*c^4*e^5*f^4*h^3*k^4+24*a*c^4*e^4*f^6*h^4*k^2-8*a*c^3*e^6*f^3*h^3*k^5-16*a*c^3*e^5*f^5*h^4*k^3+4*a*c^2*e^6*f^4*h^4*k^4);

gPoly=(8001*c^11*f^5*k^4+8000*c^10*e*f^4*k^5+15999*c^10*f^6*h*k^3-8000*c^9*e^2*f^3*k^6-15992*c^9*e*f^5*h*k^4+8009*c^9*f^7*h^2*k^2-8001*c^8*e^3*f^2*k^7+15988*c^8*e^2*f^4*h*k^5+7964*c^8*e*f^6*h^2*k^3-10*c^8*f^8*h^3*k-15993*c^7*e^3*f^3*h*k^6-7936*c^7*e^2*f^5*h^2*k^4+48*c^7*e*f^7*h^3*k^2+4*c^7*f^9*h^4-2*c^6*e^4*f^2*h*k^7-8057*c^6*e^3*f^4*h^2*k^5-92*c^6*e^2*f^6*h^3*k^3-20*c^6*e*f^8*h^4*k+24*c^5*e^4*f^3*h^2*k^6+88*c^5*e^3*f^5*h^3*k^4+40*c^5*e^2*f^7*h^4*k^2-4*c^4*e^5*f^2*h^2*k^7-42*c^4*e^4*f^4*h^3*k^5-40*c^4*e^3*f^6*h^4*k^3+8*c^3*e^5*f^3*h^3*k^6+20*c^3*e^4*f^5*h^4*k^4-4*c^2*e^5*f^4*h^4*k^5);

simplifyGcd(fPoly, gPoly);

fPoly=(-8001*a^3*c^12*e*f^3*k^6-16000*a^3*c^11*e^2*f^2*k^7+3*a^3*c^11*e*f^4*h*k^5-2*a^3*c^10*e^3*f*k^8-8022*a^3*c^10*e^2*f^3*h*k^6+15988*a^3*c^10*e*f^5*h^2*k^4-15963*a^3*c^9*e^3*f^2*h*k^7-15889*a^3*c^9*e^2*f^4*h^2*k^5+29*a^3*c^9*e*f^6*h^3*k^3-16*a^3*c^8*e^4*f*h*k^8-250*a^3*c^8*e^3*f^3*h^2*k^6-8291*a^3*c^8*e^2*f^5*h^3*k^4-8033*a^3*c^8*e*f^7*h^4*k^2+174*a^3*c^7*e^4*f^2*h^2*k^7-15251*a^3*c^7*e^3*f^4*h^3*k^5-15593*a^3*c^7*e^2*f^6*h^4*k^3+18*a^3*c^7*e*f^8*h^5*k-32*a^3*c^6*e^5*f*h^2*k^8-664*a^3*c^6*e^4*f^3*h^3*k^6-1211*a^3*c^6*e^3*f^5*h^4*k^4-315*a^3*c^6*e^2*f^7*h^5*k^2-4*a^3*c^6*e*f^9*h^6+184*a^3*c^5*e^5*f^2*h^3*k^7+1278*a^3*c^5*e^4*f^4*h^4*k^5+1054*a^3*c^5*e^3*f^6*h^5*k^3+120*a^3*c^5*e^2*f^8*h^6*k-480*a^3*c^4*e^5*f^3*h^4*k^6-1260*a^3*c^4*e^4*f^5*h^5*k^4-444*a^3*c^4*e^3*f^7*h^6*k^2-16*a^3*c^4*e^2*f^9*h^7+32*a^3*c^3*e^6*f^2*h^4*k^7+568*a^3*c^3*e^5*f^4*h^5*k^5+568*a^3*c^3*e^4*f^6*h^6*k^3+64*a^3*c^3*e^3*f^8*h^7*k-64*a^3*c^2*e^6*f^3*h^5*k^6-272*a^3*c^2*e^5*f^5*h^6*k^4-80*a^3*c^2*e^4*f^7*h^7*k^2+32*a^3*c*e^6*f^4*h^6*k^5+32*a^3*c*e^5*f^6*h^7*k^3);

gPoly=(12001*c^14*k^8-15999*c^13*f*h*k^7-2*c^12*e*h*k^8+7980*c^12*f^2*h^2*k^6+32*c^11*e*f*h^2*k^7-15909*c^11*f^3*h^3*k^5-12*c^10*e^2*h^2*k^8-204*c^10*e*f^2*h^3*k^6+11761*c^10*f^4*h^4*k^4+144*c^9*e^2*f*h^3*k^7+664*c^9*e*f^3*h^4*k^5+370*c^9*f^5*h^5*k^3-32*c^8*e^3*h^3*k^8-648*c^8*e^2*f^2*h^4*k^6-1186*c^8*e*f^4*h^5*k^4-332*c^8*f^6*h^6*k^2+256*c^7*e^3*f*h^4*k^7+1392*c^7*e^2*f^3*h^5*k^5+1176*c^7*e*f^5*h^6*k^3+160*c^7*f^7*h^7*k-32*c^6*e^4*h^4*k^8-704*c^6*e^3*f^2*h^5*k^6-1548*c^6*e^2*f^4*h^6*k^4-608*c^6*e*f^6*h^7*k^2-32*c^6*f^8*h^8+128*c^5*e^4*f*h^5*k^7+896*c^5*e^3*f^3*h^6*k^5+864*c^5*e^2*f^5*h^7*k^3+128*c^5*e*f^7*h^8*k-192*c^4*e^4*f^2*h^6*k^6-544*c^4*e^3*f^4*h^7*k^4-192*c^4*e^2*f^6*h^8*k^2+128*c^3*e^4*f^3*h^7*k^5+128*c^3*e^3*f^5*h^8*k^3-32*c^2*e^4*f^4*h^8*k^4);

simplifyGcd(fPoly, gPoly);

fPoly=(-15939*a^2*c^18*e*f^5*k^10+15314*a^2*c^17*e^2*f^4*k^11-5813*a^2*c^17*e*f^6*h*k^9+12626*a^2*c^16*e^3*f^3*k^12-6189*a^2*c^16*e^2*f^5*h*k^10-13501*a^2*c^16*e*f^7*h^2*k^8+2938*a^2*c^15*e^4*f^2*k^13+6254*a^2*c^15*e^3*f^4*h*k^11-809*a^2*c^15*e^2*f^6*h^2*k^9+14497*a^2*c^15*e*f^8*h^3*k^7+6688*a^2*c^14*e^5*f*k^14+10933*a^2*c^14*e^4*f^3*h*k^12+2667*a^2*c^14*e^3*f^5*h^2*k^10-15807*a^2*c^14*e^2*f^7*h^3*k^8+12710*a^2*c^14*e*f^9*h^4*k^6+10376*a^2*c^13*e^6*k^15-11809*a^2*c^13*e^5*f^2*h*k^13+15983*a^2*c^13*e^4*f^4*h^2*k^11-7531*a^2*c^13*e^3*f^6*h^3*k^9-11595*a^2*c^13*e^2*f^8*h^4*k^7+7759*a^2*c^13*e*f^10*h^5*k^5-377*a^2*c^12*e^6*f*h*k^14-8237*a^2*c^12*e^5*f^3*h^2*k^12+12315*a^2*c^12*e^4*f^5*h^3*k^10+14837*a^2*c^12*e^3*f^7*h^4*k^8-2945*a^2*c^12*e^2*f^9*h^5*k^6-1669*a^2*c^12*e*f^11*h^6*k^4+7001*a^2*c^11*e^7*h*k^15-5095*a^2*c^11*e^6*f^2*h^2*k^13+15751*a^2*c^11*e^5*f^4*h^3*k^11-6433*a^2*c^11*e^4*f^6*h^4*k^9-1178*a^2*c^11*e^3*f^8*h^5*k^7+13741*a^2*c^11*e^2*f^10*h^6*k^5-6075*a^2*c^11*e*f^12*h^7*k^3-7011*a^2*c^10*e^7*f*h^2*k^14+9719*a^2*c^10*e^6*f^3*h^3*k^12+2122*a^2*c^10*e^5*f^5*h^4*k^10-7622*a^2*c^10*e^4*f^7*h^5*k^8-6837*a^2*c^10*e^3*f^9*h^6*k^6+496*a^2*c^10*e^2*f^11*h^7*k^4-7959*a^2*c^10*e*f^13*h^8*k^2-16000*a^2*c^9*e^8*h^2*k^15-4923*a^2*c^9*e^7*f^2*h^3*k^13+9471*a^2*c^9*e^6*f^4*h^4*k^11+9695*a^2*c^9*e^5*f^6*h^5*k^9-5510*a^2*c^9*e^4*f^8*h^6*k^7+10543*a^2*c^9*e^3*f^10*h^7*k^5+7714*a^2*c^9*e^2*f^12*h^8*k^3+15988*a^2*c^9*e*f^14*h^9*k-8022*a^2*c^8*e^8*f*h^3*k^14+2836*a^2*c^8*e^7*f^3*h^4*k^12+341*a^2*c^8*e^6*f^5*h^5*k^10+1267*a^2*c^8*e^5*f^7*h^6*k^8-5523*a^2*c^8*e^4*f^9*h^7*k^6-15137*a^2*c^8*e^3*f^11*h^8*k^4+94*a^2*c^8*e^2*f^13*h^9*k^2+2*a^2*c^8*e*f^15*h^10-15999*a^2*c^7*e^9*h^3*k^15+8068*a^2*c^7*e^8*f^2*h^4*k^13+1994*a^2*c^7*e^7*f^4*h^5*k^11-9422*a^2*c^7*e^6*f^6*h^6*k^9+7341*a^2*c^7*e^5*f^8*h^7*k^7+14503*a^2*c^7*e^4*f^10*h^8*k^5+15717*a^2*c^7*e^3*f^12*h^9*k^3-14*a^2*c^7*e^2*f^14*h^10*k-14*a^2*c^6*e^9*f*h^4*k^14-8072*a^2*c^6*e^8*f^3*h^5*k^12+487*a^2*c^6*e^7*f^5*h^6*k^10+9827*a^2*c^6*e^6*f^7*h^7*k^8-6364*a^2*c^6*e^5*f^9*h^8*k^6+489*a^2*c^6*e^4*f^11*h^9*k^4+42*a^2*c^6*e^3*f^13*h^10*k^2+a^2*c^5*e^10*h^4*k^15+33*a^2*c^5*e^9*f^2*h^5*k^13+7970*a^2*c^5*e^8*f^4*h^6*k^11+15252*a^2*c^5*e^7*f^6*h^7*k^9+6849*a^2*c^5*e^6*f^8*h^8*k^7+15479*a^2*c^5*e^5*f^10*h^9*k^5-70*a^2*c^5*e^4*f^12*h^10*k^3-5*a^2*c^4*e^10*f*h^5*k^14-36*a^2*c^4*e^9*f^3*h^6*k^12-15865*a^2*c^4*e^8*f^5*h^7*k^10+503*a^2*c^4*e^7*f^7*h^8*k^8+356*a^2*c^4*e^6*f^9*h^9*k^6+70*a^2*c^4*e^5*f^11*h^10*k^4+9*a^2*c^3*e^10*f^2*h^6*k^13-15989*a^2*c^3*e^9*f^4*h^7*k^11-117*a^2*c^3*e^8*f^6*h^8*k^9+15850*a^2*c^3*e^7*f^8*h^9*k^7-42*a^2*c^3*e^6*f^10*h^10*k^5-7*a^2*c^2*e^10*f^3*h^7*k^12+6*a^2*c^2*e^9*f^5*h^8*k^10+37*a^2*c^2*e^8*f^7*h^9*k^8+14*a^2*c^2*e^7*f^9*h^10*k^6+2*a^2*c*e^10*f^4*h^8*k^11-4*a^2*c*e^9*f^6*h^9*k^9-2*a^2*c*e^8*f^8*h^10*k^7);

gPoly=(-5313*c^17*e*f^3*k^13+5313*c^17*f^5*h*k^11+15939*c^16*e^2*f^2*k^14-5688*c^16*e*f^4*h*k^12-10251*c^16*f^6*h^2*k^10-15939*c^15*e^3*f*k^15-3813*c^15*e^2*f^3*h*k^13+1875*c^15*e*f^5*h^2*k^11-14126*c^15*f^7*h^3*k^9+5313*c^14*e^4*k^16-7563*c^14*e^3*f^2*h*k^14+7877*c^14*e^2*f^4*h^2*k^12-10376*c^14*e*f^6*h^3*k^10+4749*c^14*f^8*h^4*k^8-9251*c^13*e^4*f*h*k^15+5623*c^13*e^3*f^3*h^2*k^13-12131*c^13*e^2*f^5*h^3*k^11-13560*c^13*e*f^7*h^4*k^9-2684*c^13*f^9*h^5*k^7-11001*c^12*e^5*h*k^16+6878*c^12*e^4*f^2*h^2*k^14-8112*c^12*e^3*f^4*h^3*k^12+193*c^12*e^2*f^6*h^4*k^10-6954*c^12*e*f^8*h^5*k^8-13007*c^12*f^10*h^6*k^6-10002*c^11*e^5*f*h^2*k^15+12734*c^11*e^4*f^3*h^3*k^13-2722*c^11*e^3*f^5*h^4*k^11-12047*c^11*e^2*f^7*h^5*k^9+14032*c^11*e*f^9*h^6*k^7-1995*c^11*f^11*h^7*k^5-2000*c^10*e^6*h^2*k^16+8012*c^10*e^5*f^2*h^3*k^14+7371*c^10*e^4*f^4*h^4*k^12+713*c^10*e^3*f^6*h^5*k^10+7940*c^10*e^2*f^8*h^6*k^8-6032*c^10*e*f^10*h^7*k^6+15999*c^10*f^12*h^8*k^4+7997*c^9*e^6*f*h^3*k^15+15952*c^9*e^5*f^3*h^4*k^13+3916*c^9*e^4*f^5*h^5*k^11-7958*c^9*e^3*f^7*h^6*k^9+12079*c^9*e^2*f^9*h^7*k^7-15985*c^9*e*f^11*h^8*k^5-16001*c^9*f^13*h^9*k^3-16001*c^8*e^7*h^3*k^16-11978*c^8*e^6*f^2*h^4*k^14+9096*c^8*e^5*f^4*h^5*k^12-972*c^8*e^4*f^6*h^6*k^10+3903*c^8*e^3*f^8*h^7*k^8-46*c^8*e^2*f^10*h^8*k^6+15998*c^8*e*f^12*h^9*k^4+15996*c^7*e^7*f*h^4*k^15-8056*c^7*e^6*f^3*h^5*k^13+1925*c^7*e^5*f^5*h^6*k^11-9945*c^7*e^4*f^7*h^7*k^9-15932*c^7*e^3*f^9*h^8*k^7-15991*c^7*e^2*f^11*h^9*k^5-16001*c^6*e^8*h^4*k^16-15985*c^6*e^7*f^2*h^5*k^14-1942*c^6*e^6*f^4*h^6*k^12-13999*c^6*e^5*f^6*h^7*k^10-60*c^6*e^4*f^8*h^8*k^8+15984*c^6*e^3*f^10*h^9*k^6-2*c^5*e^8*f*h^5*k^15-21*c^5*e^7*f^3*h^6*k^13-22*c^5*e^6*f^5*h^7*k^11-15974*c^5*e^5*f^7*h^8*k^9-15984*c^5*e^4*f^9*h^9*k^7+3*c^4*e^8*f^2*h^6*k^14-15990*c^4*e^7*f^4*h^7*k^12-4*c^4*e^6*f^6*h^8*k^10+15991*c^4*e^5*f^8*h^9*k^8-2*c^3*e^8*f^3*h^7*k^13+16000*c^3*e^7*f^5*h^8*k^11-15998*c^3*e^6*f^7*h^9*k^9-16001*c^2*e^8*f^4*h^8*k^12+16001*c^2*e^7*f^6*h^9*k^10);

simplifyGcd(fPoly, gPoly);
tst_status(1);$
