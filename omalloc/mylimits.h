/* -*-c++-*- */
/*******************************************************************
 *  File:    mylimits.h
 *  Purpose: limits.h configuration for omalloc
 *  Author:  hannes (Hans Schoenemann)
 *  Created: 03/01
 *  Version: $Id$
 *******************************************************************/
/* on IRIX-6 machines, the values in <limits.h>
* do not reflect the code generated by gcc -
* so we have to use our own
* (will result in "redefining warnings")
*/

#ifndef _MYLIMITS_H

#ifdef IRIX
#include <omalloc/omlimits.h>
#else
#include <limits.h>

#endif



//static const int MAX_INT_VAL = INT_MAX;



#endif /* _MYLIMITS_H */
