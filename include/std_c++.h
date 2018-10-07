#ifndef STD_CPP_H
#define STD_CPP_H

//-----------------

#include <std_os.h>

#include <cstdio>
#include <cctype>
#include <cstdlib>
#include <cstddef>
#include <cstring>
#include <climits>
#include <cfloat>
#include <cerrno>
#include <ctime>
#include <cstdarg>
#include <csetjmp>
#include <cassert>
#include <csignal>
#include <clocale>
#include <cmath>

extern "C" {
#include <sys/stat.h>
#include <sys/types.h>

#ifdef OS_UNIX
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <grp.h>
#include <pwd.h>
#include <sys/param.h>
#else
#include "dos.h"
#include "fcntl.h"
#include "io.h"
#include "direct.h"
#include "process.h"
#endif
}

#include <string>
#include <list>
#include <vector>
#include <map>
#include <set>
#include <queue>
#include <algorithm>
#include <functional>
#include <iostream>
#include <sstream>

#include <iomanip>

#include <std_types.h>

#include <std_macros.h>

//-----------------

#ifndef INT16_MAX
# define INT16_MAX 0x7FFF
#endif

#ifdef OS_OSX
typedef unsigned long ulong;
#endif

//-----------------

typedef void (*SignalHandler)(int sig);

extern "C" {
#ifdef OS_LINUX
extern char *strsignal(int sig) throw();
#endif
}

//-----------------

#define strndup_m(s,n) \
  strncpy((char *) calloc((n)+1,sizeof(char)),s,n)

#define memdup_m(src, n, T) \
  ((T*) memcpy(new T [n], src, (n)*sizeof(T)))

#define newstr(s) \
  strcpy(new char [strlen(s) + 1],s,n)

//-----------------

typedef int (*QSortProc)(const void *, const void *);

#if defined(OS_SUN) || defined(OS_LINUX)
typedef int (*FtwProc)(const char *file, const struct stat *sb, int flag, struct FTW *ftw);
#else
typedef int (*FtwProc)(const char *file, const struct stat *sb, int flag);
#endif

//-----------------

#ifndef SWAP
# define SWAP(a,b,T) { T t = a; a = b; b = t; }
#endif

#ifndef MIN
# define MIN(a,b) (((a) < (b)) ? (a) : (b))
# define MAX(a,b) (((a) > (b)) ? (a) : (b))
#endif

#define RAND_RANGE(x,y) ((x)+(rand()%((y)-(x)+1)))

//-----------------

#include <accessor.h>

//-----------------

#define PRINT_OP(T) \
friend ostream &operator<<(ostream &os, const T &v) { \
  v.print(os); \
  return os; \
}

//-----------------

using std::string;
using std::vector;
using std::list;
using std::map;
using std::multimap;
using std::set;
using std::pair;
using std::deque;

using std::max;
using std::min;
using std::swap;
using std::sort;
using std::equal_to;

using std::for_each;
using std::bind1st;
using std::bind2nd;
using std::mem_fun;
using std::ptr_fun;

using std::istream;
using std::ostream;
using std::ostringstream;
using std::cin;
using std::cout;
using std::cerr;
using std::dec;
using std::hex;
using std::setw;
using std::setfill;
using std::endl;

//-----------------

#define TRAP std::cerr << __FILE__ << ":" << __LINE__ << endl
#define TRAPM(m) std::cerr << m << " " << __FILE__ << ":" <<  __LINE__ << endl

#ifndef REAL_EQ
#  define REAL_EQ(a,b) (::fabs(b-a)<1E-6)
#endif

//-----------------

#include <bool_ops.h>

//-----------------

class NullType;

class EmptyType { };

//-----------------

#define CONCAT(a, b) a##b
#define CONCAT1(prefix,l) CONCAT(prefix,l)
#define UNIQUENAME(prefix) CONCAT1(prefix,__LINE__)

#define FOREACH(T, v, l) \
T::iterator UNIQUENAME(ps), UNIQUENAME(pe); \
for (UNIQUENAME(ps) = l.begin(), UNIQUENAME(pe) = l.end(); \
     UNIQUENAME(ps) != UNIQUENAME(pe); ++UNIQUENAME(ps)) { \
  T::value_type v = *UNIQUENAME(ps);

#define FOREACH_CONST(T, v, l) \
T::const_iterator UNIQUENAME(ps), UNIQUENAME(pe); \
for (UNIQUENAME(ps) = l.begin(), UNIQUENAME(pe) = l.end(); \
     UNIQUENAME(ps) != UNIQUENAME(pe); ++UNIQUENAME(ps)) { \
  T::value_type v = *UNIQUENAME(ps);

#define END_FOREACH \
}
//-----------------

#endif
