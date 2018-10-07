#ifndef STD_TYPES_H
#define STD_TYPES_H

#include <std_config.h>

typedef signed char  schar;
typedef signed short sshort;
typedef signed int   sint;
typedef signed long  slong;

typedef unsigned char uchar;

#ifdef NO_STD_U_TYPES
typedef unsigned short ushort;
typedef unsigned int   uint;
typedef unsigned long  ulong;
#endif

#ifndef INT8_DEFINED
typedef signed char int8;
#endif

typedef short int16;
typedef int   int32;

typedef unsigned char  uint8;
typedef unsigned short uint16;
typedef unsigned int   uint32;

typedef float  real32;
typedef double real64;

#endif
