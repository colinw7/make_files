#ifndef STD_ARG_H
#define STD_ARG_H

#if defined(__STDC__) || defined(OS_WIN)
# include <stdarg.h>
#else
# include <varargs.h>
#endif

#ifndef ARGS
#  if defined(__STDC__) || defined(OS_WIN)
#    define ARGS(a) a
#  else
#    define ARGS(a) ()
#  endif
#endif

#if defined(__STDC__)  || defined(OS_WIN)
#  define VA_START(a,b) va_start(a,b)
#else
#  define VA_START(a,b) va_start(a)
#endif

#endif
