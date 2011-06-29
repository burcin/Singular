/****************************************
*  Computer Algebra System SINGULAR     *
****************************************/
/* $Id$ */
/*
* ABSTRACT: numbers in a rational function field K(t_1, .., t_s) with
*           transcendental variables t_1, ..., t_s, where s >= 1.
*           Denoting the implemented coeffs object by cf, then these numbers
*           are represented as quotients of polynomials in the polynomial
*           ring K[t_1, .., t_s] represented by cf->algring.
*/

#include "config.h"
#include <misc/auxiliary.h>

#include <omalloc/omalloc.h>

#include <reporter/reporter.h>

#include <coeffs/coeffs.h>
#include <coeffs/numbers.h>
#include <coeffs/longrat.h>

#include <polys/monomials/ring.h>
#include <polys/monomials/p_polys.h>
#include <polys/simpleideals.h>

#include <polys/ext_fields/transext.h>

/// our type has been defined as a macro in transext.h
/// and is accessible by 'ntID'

extern omBin fractionObjectBin = omGetSpecBin(sizeof(fractionObject));

/// forward declarations
BOOLEAN  ntGreaterZero(number a, const coeffs cf); 
BOOLEAN  ntGreater(number a, number b, const coeffs cf);
BOOLEAN  ntEqual(number a, number b, const coeffs cf);
BOOLEAN  ntIsOne(number a, const coeffs cf);
BOOLEAN  ntIsMOne(number a, const coeffs cf);
BOOLEAN  ntIsZero(number a, const coeffs cf);
number   ntInit(int i, const coeffs cf);
int      ntInt(number &a, const coeffs cf);
number   ntNeg(number a, const coeffs cf);
number   ntInvers(number a, const coeffs cf);
number   ntPar(int i, const coeffs cf);
number   ntAdd(number a, number b, const coeffs cf);
number   ntSub(number a, number b, const coeffs cf);
number   ntMult(number a, number b, const coeffs cf);
number   ntDiv(number a, number b, const coeffs cf);
void     ntPower(number a, int exp, number *b, const coeffs cf);
number   ntCopy(number a, const coeffs cf);
void     ntWrite(number &a, const coeffs cf);
number   ntRePart(number a, const coeffs cf);
number   ntImPart(number a, const coeffs cf);
number   ntGetDenom(number &a, const coeffs cf);
number   ntGetNumerator(number &a, const coeffs cf);
number   ntGcd(number a, number b, const coeffs cf);
number   ntLcm(number a, number b, const coeffs cf);
int      ntSize(number a, const coeffs cf);
void     ntDelete(number * a, const coeffs cf);
void     ntCoeffWrite(const coeffs cf);
number   ntIntDiv(number a, number b, const coeffs cf);
const char * ntRead(const char *s, number *a, const coeffs cf);
static BOOLEAN ntCoeffIsEqual(const coeffs cf, n_coeffType n, void * param);

void heuristicGcdCancellation(number a, const coeffs cf);
void definiteGcdCancellation(number a, const coeffs cf,
                             BOOLEAN skipSimpleTests);

#ifdef LDEBUG
BOOLEAN ntDBTest(number a, const char *f, const int l, const coeffs cf)
{
  assume(getCoeffType(cf) == ntID);
  fraction t = (fraction)a;
  if (is0(t)) return TRUE;
  assume(num(t) != NULL);   /**< t != 0 ==> numerator(t) != 0 */
  p_Test(num(t), ntRing);
  if (!denIs1(t)) p_Test(den(t), ntRing);
  return TRUE;
}
#endif

/* returns the bottom field in this field extension tower; if the tower
   is flat, i.e., if there is no extension, then r itself is returned;
   as a side-effect, the counter 'height' is filled with the height of
   the extension tower (in case the tower is flat, 'height' is zero) */
static coeffs nCoeff_bottom(const coeffs r, int &height)
{
  assume(r != NULL);
  coeffs cf = r;
  height = 0;
  while (nCoeff_is_Extension(cf))
  {
    assume(cf->extRing != NULL); assume(cf->extRing->cf != NULL);
    cf = cf->extRing->cf;
    height++;
  }
  return cf;
}

BOOLEAN ntIsZero(number a, const coeffs cf)
{
  ntTest(a);
  return (is0(a));
}

void ntDelete(number * a, const coeffs cf)
{
  fraction f = (fraction)(*a);
  if (is0(f)) return;
  p_Delete(&num(f), ntRing);
  if (!denIs1(f)) p_Delete(&den(f), ntRing);
  omFreeBin((ADDRESS)f, fractionObjectBin);
  *a = NULL;
}

BOOLEAN ntEqual(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  
  /// simple tests
  if (a == b) return TRUE;
  if ((is0(a)) && (!is0(b))) return FALSE;
  if ((is0(b)) && (!is0(a))) return FALSE;
  
  /// cheap test if gcd's have been cancelled in both numbers 
  fraction fa = (fraction)a;
  fraction fb = (fraction)b;
  if ((c(fa) == 1) && (c(fb) == 1))
  {
    poly f = p_Add_q(p_Copy(num(fa), ntRing),
                     p_Neg(p_Copy(num(fb), ntRing), ntRing),
                     ntRing);
    if (f != NULL) { p_Delete(&f, ntRing); return FALSE; }
    if (denIs1(fa) && denIs1(fb))  return TRUE;
    if (denIs1(fa) && !denIs1(fb)) return FALSE;
    if (!denIs1(fa) && denIs1(fb)) return FALSE;
    f = p_Add_q(p_Copy(den(fa), ntRing),
                p_Neg(p_Copy(den(fb), ntRing), ntRing),
                ntRing);
    if (f != NULL) { p_Delete(&f, ntRing); return FALSE; }
    return TRUE;
  }
  
  /* default: the more expensive multiplication test
              a/b = c/d  <==>  a*d = b*c */
  poly f = p_Copy(num(fa), ntRing);
  if (!denIs1(fb)) f = p_Mult_q(f, p_Copy(den(fb), ntRing), ntRing);
  poly g = p_Copy(num(fb), ntRing);
  if (!denIs1(fa)) g = p_Mult_q(g, p_Copy(den(fa), ntRing), ntRing);
  poly h = p_Add_q(f, p_Neg(g, ntRing), ntRing);
  if (h == NULL) return TRUE;
  else
  {
    p_Delete(&h, ntRing);
    return FALSE;
  }
}

number ntCopy(number a, const coeffs cf)
{
  ntTest(a);
  if (is0(a)) return NULL;
  fraction f = (fraction)a;
  poly g = p_Copy(num(f), ntRing);
  poly h = NULL; if (!denIs1(f)) h = p_Copy(den(f), ntRing);
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = g;
  den(result) = h;
  c(result) = c(f);
  return (number)result;
}

number ntGetNumerator(number &a, const coeffs cf)
{
  ntTest(a);
  definiteGcdCancellation(a, cf, FALSE);
  if (is0(a)) return NULL;
  fraction f = (fraction)a;
  poly g = p_Copy(num(f), ntRing);
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = g;
  den(result) = NULL;
  c(result) = 0;
  return (number)result;
}

number ntGetDenom(number &a, const coeffs cf)
{
  ntTest(a);
  definiteGcdCancellation(a, cf, FALSE);
  fraction f = (fraction)a;
  poly g;
  if (is0(f) || denIs1(f)) g = p_One(ntRing);
  else g = p_Copy(den(f), ntRing);
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = g;
  den(result) = NULL;
  c(result) = 0;
  return (number)result;
}

BOOLEAN ntIsOne(number a, const coeffs cf)
{
  ntTest(a);
  definiteGcdCancellation(a, cf, FALSE);
  fraction f = (fraction)a;
  return denIs1(f) && numIs1(f);
}

BOOLEAN ntIsMOne(number a, const coeffs cf)
{
  ntTest(a);
  definiteGcdCancellation(a, cf, FALSE);
  fraction f = (fraction)a;
  if (!denIs1(f)) return FALSE;
  poly g = num(f);
  if (!p_IsConstant(g, ntRing)) return FALSE;
  return n_IsMOne(p_GetCoeff(g, ntRing), ntCoeffs);
}

/// this is in-place, modifies a
number ntNeg(number a, const coeffs cf)
{
  ntTest(a);
  if (!is0(a))
  {
    fraction f = (fraction)a;
    num(f) = p_Neg(num(f), ntRing);
  }
  return a;
}

number ntImPart(number a, const coeffs cf)
{
  ntTest(a);
  return NULL;
}

number ntInit(int i, const coeffs cf)
{
  if (i == 0) return NULL;
  else
  {
    fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
    num(result) = p_ISet(i, ntRing);
    den(result) = NULL;
    c(result) = 0;
    return (number)result;
  }
}

int ntInt(number &a, const coeffs cf)
{
  ntTest(a);
  if (is0(a)) return 0;
  definiteGcdCancellation(a, cf, FALSE);
  fraction f = (fraction)a;
  if (!denIs1(f)) return 0;
  if (!p_IsConstant(num(f), ntRing)) return 0;
  return n_Int(p_GetCoeff(num(f), ntRing), ntCoeffs);
}

/* This method will only consider the numerators of a and b, without
   cancelling gcd's before.
   Moreover it may return TRUE only if one or both numerators
   are zero or if their degrees are equal. Then TRUE is returned iff
   coeff(numerator(a)) > coeff(numerator(b));
   In all other cases, FALSE will be returned. */
BOOLEAN ntGreater(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  number aNumCoeff = NULL; int aNumDeg = 0;
  number bNumCoeff = NULL; int bNumDeg = 0;
  if (!is0(a))
  {
    fraction fa = (fraction)a;
    aNumDeg = p_Totaldegree(num(fa), ntRing);
    aNumCoeff = p_GetCoeff(num(fa), ntRing);
  }
  if (!is0(b))
  {
    fraction fb = (fraction)b;
    bNumDeg = p_Totaldegree(num(fb), ntRing);
    bNumCoeff = p_GetCoeff(num(fb), ntRing);
  }
  if (aNumDeg != bNumDeg) return FALSE;
  else return n_Greater(aNumCoeff, bNumCoeff, ntCoeffs);
}

/* this method will only consider the numerator of a, without cancelling
   the gcd before;
   returns TRUE iff the leading coefficient of the numerator of a is > 0
                    or the leading term of the numerator of a is not a
                    constant */
BOOLEAN ntGreaterZero(number a, const coeffs cf)
{
  ntTest(a);
  if (is0(a)) return FALSE;
  fraction f = (fraction)a;
  poly g = num(f);
  return (n_GreaterZero(p_GetCoeff(g, ntRing), ntCoeffs) ||
          (!p_LmIsConstant(g, ntRing)));
}

void ntCoeffWrite(const coeffs cf)
{
  PrintS("//   Coefficients live in the rational function field\n");
  Print("//   K(");
  for (int i = 0; i < rVar(ntRing); i++)
  {
    if (i > 0) PrintS(", ");
    Print("%s", rRingVar(i, ntRing));
  }
  PrintS(") with\n");
  PrintS("//   K: "); n_CoeffWrite(cf->extRing->cf);
}

/* the i-th parameter */
number ntPar(int i, const coeffs cf)
{
  assume((1 <= i) && (i <= rVar(ntRing)));
  poly p = p_ISet(1, ntRing);
  p_SetExp(p, i, 1, ntRing);
  p_Setm(p, ntRing);
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = p;
  den(result) = NULL;
  c(result) = 0;
  return (number)result;
}

number ntAdd(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  if (is0(a)) return ntCopy(b, cf);
  if (is0(b)) return ntCopy(a, cf);
  
  fraction fa = (fraction)a;
  fraction fb = (fraction)b;
  
  poly g = p_Copy(num(fa), ntRing);
  if (!denIs1(fb)) g = p_Mult_q(g, p_Copy(den(fb), ntRing), ntRing);
  poly h = p_Copy(num(fb), ntRing);
  if (!denIs1(fa)) h = p_Mult_q(h, p_Copy(den(fa), ntRing), ntRing);
  g = p_Add_q(g, h, ntRing);
  
  if (g == NULL) return NULL;
  
  poly f;
  if      (denIs1(fa) && denIs1(fb))  f = NULL;
  else if (!denIs1(fa) && denIs1(fb)) f = p_Copy(den(fa), ntRing);
  else if (denIs1(fa) && !denIs1(fb)) f = p_Copy(den(fb), ntRing);
  else /* both denom's are != 1 */    f = p_Mult_q(p_Copy(den(fa), ntRing),
                                                   p_Copy(den(fb), ntRing),
                                                   ntRing);
  
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = g;
  den(result) = f;
  c(result) = c(fa) + c(fb) + ADD_COMPLEXITY;
  heuristicGcdCancellation((number)result, cf);
  return (number)result;
}

number ntSub(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  if (is0(a)) return ntNeg(ntCopy(b, cf), cf);
  if (is0(b)) return ntCopy(a, cf);
  
  fraction fa = (fraction)a;
  fraction fb = (fraction)b;
  
  poly g = p_Copy(num(fa), ntRing);
  if (!denIs1(fb)) g = p_Mult_q(g, p_Copy(den(fb), ntRing), ntRing);
  poly h = p_Copy(num(fb), ntRing);
  if (!denIs1(fa)) h = p_Mult_q(h, p_Copy(den(fa), ntRing), ntRing);
  g = p_Add_q(g, p_Neg(h, ntRing), ntRing);
  
  if (g == NULL) return NULL;
  
  poly f;
  if      (denIs1(fa) && denIs1(fb))  f = NULL;
  else if (!denIs1(fa) && denIs1(fb)) f = p_Copy(den(fa), ntRing);
  else if (denIs1(fa) && !denIs1(fb)) f = p_Copy(den(fb), ntRing);
  else /* both den's are != 1 */      f = p_Mult_q(p_Copy(den(fa), ntRing),
                                                   p_Copy(den(fb), ntRing),
                                                   ntRing);
  
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = g;
  den(result) = f;
  c(result) = c(fa) + c(fb) + ADD_COMPLEXITY;
  heuristicGcdCancellation((number)result, cf);
  return (number)result;
}

number ntMult(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  if (is0(a) || is0(b)) return NULL;
  
  fraction fa = (fraction)a;
  fraction fb = (fraction)b;
  
  poly g = p_Copy(num(fa), ntRing);
  poly h = p_Copy(num(fb), ntRing);
  g = p_Mult_q(g, h, ntRing);
  
  if (g == NULL) return NULL;   /* may happen due to zero divisors */
  
  poly f;
  if      (denIs1(fa) && denIs1(fb))  f = NULL;
  else if (!denIs1(fa) && denIs1(fb)) f = p_Copy(den(fa), ntRing);
  else if (denIs1(fa) && !denIs1(fb)) f = p_Copy(den(fb), ntRing);
  else /* both den's are != 1 */      f = p_Mult_q(p_Copy(den(fa), ntRing),
                                                   p_Copy(den(fb), ntRing),
                                                   ntRing);
  
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = g;
  den(result) = f;
  c(result) = c(fa) + c(fb) + MULT_COMPLEXITY;
  heuristicGcdCancellation((number)result, cf);
  return (number)result;
}

number ntDiv(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  if (is0(a)) return NULL;
  if (is0(b)) WerrorS(nDivBy0);
  
  fraction fa = (fraction)a;
  fraction fb = (fraction)b;
  
  poly g = p_Copy(num(fa), ntRing);
  if (!denIs1(fb)) g = p_Mult_q(g, p_Copy(den(fb), ntRing), ntRing);
  
  if (g == NULL) return NULL;   /* may happen due to zero divisors */
  
  poly f = p_Copy(num(fb), ntRing);
  if (!denIs1(fa)) f = p_Mult_q(f, p_Copy(den(fa), ntRing), ntRing);
  
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  num(result) = g;
  den(result) = f;
  c(result) = c(fa) + c(fb) + MULT_COMPLEXITY;
  heuristicGcdCancellation((number)result, cf);
  return (number)result;
}

/* 0^0 = 0;
   for |exp| <= 7 compute power by a simple multiplication loop;
   for |exp| >= 8 compute power along binary presentation of |exp|, e.g.
      p^13 = p^1 * p^4 * p^8, where we utilise that
      p^(2^(k+1)) = p^(2^k) * p^(2^k);
   intermediate cancellation is controlled by the in-place method
   heuristicGcdCancellation; see there.
*/
void ntPower(number a, int exp, number *b, const coeffs cf)
{
  ntTest(a);
  
  /* special cases first */
  if (is0(a))
  {
    if (exp >= 0) *b = NULL;
    else          WerrorS(nDivBy0);
  }
  else if (exp ==  0) *b = ntInit(1, cf);
  else if (exp ==  1) *b = ntCopy(a, cf);
  else if (exp == -1) *b = ntInvers(a, cf);
  
  int expAbs = exp; if (expAbs < 0) expAbs = -expAbs;
  
  /* now compute a^expAbs */
  number pow; number t;
  if (expAbs <= 7)
  {
    pow = ntCopy(a, cf);
    for (int i = 2; i <= expAbs; i++)
    {
      t = ntMult(pow, a, cf);
      ntDelete(&pow, cf);
      pow = t;
      heuristicGcdCancellation(pow, cf);
    }
  }
  else
  {
    pow = ntInit(1, cf);
    number factor = ntCopy(a, cf);
    while (expAbs != 0)
    {
      if (expAbs & 1)
      {
        t = ntMult(pow, factor, cf);
        ntDelete(&pow, cf);
        pow = t;
        heuristicGcdCancellation(pow, cf);
      }
      expAbs = expAbs / 2;
      if (expAbs != 0)
      {
        t = ntMult(factor, factor, cf);
        ntDelete(&factor, cf);
        factor = t;
        heuristicGcdCancellation(factor, cf);
      }
    }
    ntDelete(&factor, cf);
  }
  
  /* invert if original exponent was negative */
  if (exp < 0)
  {
    t = ntInvers(pow, cf);
    ntDelete(&pow, cf);
    pow = t;
  }
  *b = pow;
}

/* modifies a */
void heuristicGcdCancellation(number a, const coeffs cf)
{
  ntTest(a);
  if (is0(a)) return;
  
  fraction f = (fraction)a;
  if (denIs1(f) || numIs1(f)) { c(f) = 0; return; }
  
  /* check whether num(f) = den(f), and - if so - replace 'a' by 1 */
  poly difference = p_Add_q(p_Copy(num(f), ntRing),
                            p_Neg(p_Copy(den(f), ntRing), ntRing),
                            ntRing);
  if (difference == NULL)
  { /* we also know that numerator and denominator are both != 1 */
    p_Delete(&num(f), ntRing); num(f) = p_ISet(1, ntRing);
    p_Delete(&den(f), ntRing); den(f) = NULL;
    c(f) = 0;
    return;
  }
  else p_Delete(&difference, ntRing);
  
  if (c(f) <= BOUND_COMPLEXITY) return;
  else definiteGcdCancellation(a, cf, TRUE);
}

/* modifies a */
void definiteGcdCancellation(number a, const coeffs cf,
                             BOOLEAN skipSimpleTests)
{
  ntTest(a);
  
  fraction f = (fraction)a;
  
  if (!skipSimpleTests)
  {
    if (is0(a)) return;
    if (denIs1(f) || numIs1(f)) { c(f) = 0; return; }
  
    /* check whether num(f) = den(f), and - if so - replace 'a' by 1 */
    poly difference = p_Add_q(p_Copy(num(f), ntRing),
                              p_Neg(p_Copy(den(f), ntRing), ntRing),
                              ntRing);
    if (difference == NULL)
    { /* we also know that numerator and denominator are both != 1 */
      p_Delete(&num(f), ntRing); num(f) = p_ISet(1, ntRing);
      p_Delete(&den(f), ntRing); den(f) = NULL;
      c(f) = 0;
      return;
    }
    else p_Delete(&difference, ntRing);
  }
  
  /* TO BE IMPLEMENTED!
     for the time being, cancellation of gcd's does not take place */
  Print("// TO BE IMPLEMENTED: transext.cc:definiteGcdCancellation\n");
  Print("// (complexity of number = %d, bound = %d)\n",
        c(f), BOUND_COMPLEXITY);
}

void ntWrite(number &a, const coeffs cf)
{
  ntTest(a);
  definiteGcdCancellation(a, cf, FALSE);
  if (is0(a))
    StringAppendS("0");
  else
  {
    fraction f = (fraction)a;
    BOOLEAN useBrackets = !(p_IsConstant(num(f), ntRing)) && (!denIs1(f));
    if (useBrackets) StringAppendS("(");
    p_String0(num(f), ntRing, ntRing);
    if (useBrackets) StringAppendS(")");
    if (!denIs1(f))
    {
      StringAppendS("/");
      useBrackets = !p_IsConstant(den(f), ntRing);
      if (useBrackets) StringAppendS("(");
      p_String0(den(f), ntRing, ntRing);
      if (useBrackets) StringAppendS(")");
    }
  }
}

const char * ntRead(const char *s, number *a, const coeffs cf)
{
  poly p;
  const char * result = p_Read(s, p, ntRing);
  if (p == NULL) { *a = NULL; return result; }
  else
  {
    fraction f = (fraction)omAlloc0Bin(fractionObjectBin);
    num(f) = p;
    den(f) = NULL;
    c(f) = 0;
    *a = (number)f;
    return result;
  }
}

/* expects *param to be castable to TransExtInfo */
static BOOLEAN ntCoeffIsEqual(const coeffs cf, n_coeffType n, void * param)
{
  if (ntID != n) return FALSE;
  TransExtInfo *e = (TransExtInfo *)param;
  /* for rational function fields we expect the underlying
     polynomial rings to be IDENTICAL, i.e. the SAME OBJECT;
     this expectation is based on the assumption that we have properly
     registered cf and perform reference counting rather than creating
     multiple copies of the same coefficient field/domain/ring */
  return (ntRing == e->r);
}

number ntLcm(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  /* TO BE IMPLEMENTED!
     for the time, we simply return NULL, representing the number zero */
  Print("// TO BE IMPLEMENTED: transext.cc:ntLcm\n");
  return NULL;
}

number ntGcd(number a, number b, const coeffs cf)
{
  ntTest(a); ntTest(b);
  /* TO BE IMPLEMENTED!
     for the time, we simply return NULL, representing the number zero */
  Print("// TO BE IMPLEMENTED: transext.cc:ntGcd\n");
  return NULL;
}

int ntSize(number a, const coeffs cf)
{
  ntTest(a);
  if (is0(a)) return -1;
  /* this has been taken from the old implementation of field extensions,
     where we computed the sum of the degrees and the numbers of terms in
     the numerator and denominator of a; so we leave it at that, for the
     time being */
  fraction f = (fraction)a;
  poly p = num(f);
  int noOfTerms = 0;
  int numDegree = 0;
  while (p != NULL)
  {
    noOfTerms++;
    int d = 0;
    for (int i = 1; i <= rVar(ntRing); i++)
      d += p_GetExp(p, i, ntRing);
    if (d > numDegree) numDegree = d;
    pIter(p);
  }
  int denDegree = 0;
  if (!denIs1(f))
  {
    p = den(f);
    while (p != NULL)
    {
      noOfTerms++;
      int d = 0;
      for (int i = 1; i <= rVar(ntRing); i++)
        d += p_GetExp(p, i, ntRing);
      if (d > denDegree) denDegree = d;
      pIter(p);
    }
  }
  return numDegree + denDegree + noOfTerms;
}

number ntInvers(number a, const coeffs cf)
{
  ntTest(a);
  if (is0(a)) WerrorS(nDivBy0);
  fraction f = (fraction)a;
  fraction result = (fraction)omAlloc0Bin(fractionObjectBin);
  poly g;
  if (denIs1(f)) g = p_One(ntRing);
  else           g = p_Copy(den(f), ntRing);
  num(result) = g;
  den(result) = p_Copy(num(f), ntRing);
  c(result) = c(f);
  return (number)result;
}

/* assumes that src = Q, dst = Q(t_1, ..., t_s) */
number ntMap00(number a, const coeffs src, const coeffs dst)
{
  if (n_IsZero(a, src)) return NULL;
  assume(src == dst->extRing->cf);
  poly p = p_One(dst->extRing);
  p_SetCoeff(p, ntCopy(a, src), dst->extRing);
  fraction f = (fraction)omAlloc0Bin(fractionObjectBin);
  num(f) = p; den(f) = NULL; c(f) = 0;
  return (number)f;
}

/* assumes that src = Z/p, dst = Q(t_1, ..., t_s) */
number ntMapP0(number a, const coeffs src, const coeffs dst)
{
  if (n_IsZero(a, src)) return NULL;
  /* mapping via intermediate int: */
  int n = n_Int(a, src);
  number q = n_Init(n, dst->extRing->cf);
  poly p;
  if (n_IsZero(q, dst->extRing->cf))
  {
    n_Delete(&q, dst->extRing->cf);
    return NULL;
  }
  p = p_One(dst->extRing);
  p_SetCoeff(p, q, dst->extRing);
  fraction f = (fraction)omAlloc0Bin(fractionObjectBin);
  num(f) = p; den(f) = NULL; c(f) = 0;
  return (number)f;
}

/* assumes that either src = Q(t_1, ..., t_s), dst = Q(t_1, ..., t_s), or
                       src = Z/p(t_1, ..., t_s), dst = Z/p(t_1, ..., t_s) */
number ntCopyMap(number a, const coeffs src, const coeffs dst)
{
  return ntCopy(a, dst);
}

/* assumes that src = Q, dst = Z/p(t_1, ..., t_s) */
number ntMap0P(number a, const coeffs src, const coeffs dst)
{
  if (n_IsZero(a, src)) return NULL;
  int p = rChar(dst->extRing);
  int n = nlModP(a, p, src);
  number q = n_Init(n, dst->extRing->cf);
  poly g;
  if (n_IsZero(q, dst->extRing->cf))
  {
    n_Delete(&q, dst->extRing->cf);
    return NULL;
  }
  g = p_One(dst->extRing);
  p_SetCoeff(g, q, dst->extRing);
  fraction f = (fraction)omAlloc0Bin(fractionObjectBin);
  num(f) = g; den(f) = NULL; c(f) = 0;
  return (number)f;
}

/* assumes that src = Z/p, dst = Z/p(t_1, ..., t_s) */
number ntMapPP(number a, const coeffs src, const coeffs dst)
{
  if (n_IsZero(a, src)) return NULL;
  assume(src == dst->extRing->cf);
  poly p = p_One(dst->extRing);
  p_SetCoeff(p, ntCopy(a, src), dst->extRing);
  fraction f = (fraction)omAlloc0Bin(fractionObjectBin);
  num(f) = p; den(f) = NULL; c(f) = 0;
  return (number)f;
}

/* assumes that src = Z/u, dst = Z/p(t_1, ..., t_s), where u != p */
number ntMapUP(number a, const coeffs src, const coeffs dst)
{
  if (n_IsZero(a, src)) return NULL;
  /* mapping via intermediate int: */
  int n = n_Int(a, src);
  number q = n_Init(n, dst->extRing->cf);
  poly p;
  if (n_IsZero(q, dst->extRing->cf))
  {
    n_Delete(&q, dst->extRing->cf);
    return NULL;
  }
  p = p_One(dst->extRing);
  p_SetCoeff(p, q, dst->extRing);
  fraction f = (fraction)omAlloc0Bin(fractionObjectBin);
  num(f) = p; den(f) = NULL; c(f) = 0;
  return (number)f;
}

nMapFunc ntSetMap(const coeffs src, const coeffs dst)
{
  /* dst is expected to be a rational function field */
  assume(getCoeffType(dst) == ntID);
  
  int h = 0; /* the height of the extension tower given by dst */
  coeffs bDst = nCoeff_bottom(dst, h); /* the bottom field in the tower dst */
  
  /* for the time being, we only provide maps if h = 1 and if b is Q or
     some field Z/pZ: */
  if (h != 1) return NULL;
  if ((!nCoeff_is_Zp(bDst)) && (!nCoeff_is_Q(bDst))) return NULL;
  
  /* Let T denote the sequence of transcendental extension variables, i.e.,
     K[t_1, ..., t_s] =: K[T];
     Let moreover, for any such sequence T, T' denote any subsequence of T
     of the form t_1, ..., t_w with w <= s. */
  
  if (nCoeff_is_Q(src) && nCoeff_is_Q(bDst))
    return ntMap00;                                      /// Q       -->  Q(T)
  
  if (nCoeff_is_Zp(src) && nCoeff_is_Q(bDst))
    return ntMapP0;                                      /// Z/p     -->  Q(T)
  
  if (nCoeff_is_Q(src) && nCoeff_is_Zp(bDst))
    return ntMap0P;                                      /// Q       --> Z/p(T)
  
  if (nCoeff_is_Zp(src) && nCoeff_is_Zp(bDst))
  {
    if (src->ch == dst->ch) return ntMapPP;              /// Z/p     --> Z/p(T)
    else return ntMapUP;                                 /// Z/u     --> Z/p(T)
  }
  
  coeffs bSrc = nCoeff_bottom(src, h); /* the bottom field in the tower src */
  if (h != 1) return NULL;
  if ((!nCoeff_is_Zp(bSrc)) && (!nCoeff_is_Q(bSrc))) return NULL;
  
  if (nCoeff_is_Q(bSrc) && nCoeff_is_Q(bDst))
  {
    if (rVar(src->extRing) > rVar(dst->extRing)) return NULL;
    for (int i = 0; i < rVar(src->extRing); i++)
      if (strcmp(rRingVar(i, src->extRing),
                 rRingVar(i, dst->extRing)) != 0) return NULL;
      return ntCopyMap;                                  /// Q(T')   --> Q(T)
  }
  
  if (nCoeff_is_Zp(bSrc) && nCoeff_is_Zp(bDst))
  {
    if (rVar(src->extRing) > rVar(dst->extRing)) return NULL;
    for (int i = 0; i < rVar(src->extRing); i++)
      if (strcmp(rRingVar(i, src->extRing),
                 rRingVar(i, dst->extRing)) != 0) return NULL;
      return ntCopyMap;                                  /// Z/p(T') --> Z/p(T)
  }
  
  return NULL;                                           /// default
}

BOOLEAN ntInitChar(coeffs cf, void * infoStruct)
{  
  TransExtInfo *e = (TransExtInfo *)infoStruct;
  /// first check whether cf->extRing != NULL and delete old ring???
  cf->extRing           = e->r;
  cf->extRing->minideal = NULL;

  assume(cf->extRing                != NULL);      // extRing;
  assume(cf->extRing->cf            != NULL);      // extRing->cf;
  assume(getCoeffType(cf) == ntID);                // coeff type;
  
  /* propagate characteristic up so that it becomes
     directly accessible in cf: */
  cf->ch = cf->extRing->cf->ch;
  
  cf->cfGreaterZero  = ntGreaterZero;
  cf->cfGreater      = ntGreater;
  cf->cfEqual        = ntEqual;
  cf->cfIsZero       = ntIsZero;
  cf->cfIsOne        = ntIsOne;
  cf->cfIsMOne       = ntIsMOne;
  cf->cfInit         = ntInit;
  cf->cfInt          = ntInt;
  cf->cfNeg          = ntNeg;
  cf->cfPar          = ntPar;
  cf->cfAdd          = ntAdd;
  cf->cfSub          = ntSub;
  cf->cfMult         = ntMult;
  cf->cfDiv          = ntDiv;
  cf->cfExactDiv     = ntDiv;
  cf->cfPower        = ntPower;
  cf->cfCopy         = ntCopy;
  cf->cfWrite        = ntWrite;
  cf->cfRead         = ntRead;
  cf->cfDelete       = ntDelete;
  cf->cfSetMap       = ntSetMap;
  cf->cfGetDenom     = ntGetDenom;
  cf->cfGetNumerator = ntGetNumerator;
  cf->cfRePart       = ntCopy;
  cf->cfImPart       = ntImPart;
  cf->cfCoeffWrite   = ntCoeffWrite;
  cf->cfDBTest       = ntDBTest;
  cf->cfGcd          = ntGcd;
  cf->cfLcm          = ntLcm;
  cf->cfSize         = ntSize;
  cf->nCoeffIsEqual  = ntCoeffIsEqual;
  cf->cfInvers       = ntInvers;
  cf->cfIntDiv       = ntDiv;
  
  return FALSE;
}
