#ifndef STD_C_H
#define STD_C_H

#include "std_os.h"

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <float.h>
#include <errno.h>
#include <time.h>
#include <sys/stat.h>
#include <setjmp.h>
#include <assert.h>
#include <signal.h>
#include <locale.h>
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

#include "std_arg.h"

#include "std_types.h"

#include "std_macros.h"

#if ! defined(TRUE) && ! defined(FALSE)
# define TRUE  1
# define FALSE 0
#endif

#ifndef SKIP_PUBLIC
# define PUBLIC
# define PRIVATE
# define INTERNAL static
#endif

#ifndef PI
# define PI 3.141592653
#endif

#if ! defined(max) && ! defined(min)
# define min(a,b) ((a)<(b)?(a):(b))
# define max(a,b) ((a)>(b)?(a):(b))
#endif

#ifndef ROUND
# define ROUND(x) ((int)((x) + 0.5))
#endif

#define IROUND(r,imin,imax) \
 ((int) ((r) + 0.9999*((r) - (imin))/((imax) - (imin))))

#ifndef MAXPATHLEN
# define MAXPATHLEN 256
#endif

#ifndef S_ISDIR
# define S_ISDIR(m) ((m) & S_IFDIR)
# define S_ISREG(m) ((m) & S_IFREG)
#endif

#define DOS_FILE_SEP  '\\'
#define UNIX_FILE_SEP '/'

#if defined(OS_UNIX)
# define FILE_SEP UNIX_FILE_SEP
#else
# define FILE_SEP DOS_FILE_SEP
#endif

typedef void (*SignalHandler)(int sig);
typedef int (*QSortProc)(const void *, const void *);
typedef int (*FtwProc)(const char *file, const struct stat *sb, int flag);

#define SET_BIT(v,n)  ((v) |=  (1 << (n)))
#define RST_BIT(v,n)  ((v) &= ~(1 << (n)))
#define TST_BIT(v,n) (((v) &   (1 << (n))) ? 1 : 0)

#define RESET_BIT(v,n)  ((v) &= ~(1 << (n)))
#define IS_BIT(v,n)    (((v) &   (1 << (n))) ? 1 : 0)

#define TRAP fprintf(stderr, "%s:%d", __FILE__, __LINE__)
#define TRAPM(m) fprintf(stderr, "%s : %s:%d", m, __FILE__, __LINE__)

typedef unsigned long ulong;

#endif
